import Fly from "flyio/dist/npm/wx"
import store from '../store/index'
import {host} from '../utils/index'
const fly = new Fly()
const newFly = new Fly()


fly.config.baseURL = host
newFly.config.baseURL = host



const api = {
    async get(url, data) {
        try {
            let res = await fly.get(url, {
                ...data
            })
            res = res.data
            return new Promise((resolve, reject) => {
                if (res.code === 0) {
                    resolve(res)
                } else {
                    reject(res)
                }
            })
        } catch (err) {
            console.log(err)
        }
    },
    async post(url, data) {
        try {
            let res = await fly.post(url, data instanceof Object ? data : {})
            res = res.data
            return new Promise((resolve, reject) => {
                if (res.code === 0) {
                    resolve(res)
                } else {
                    reject(res)
                }
            })
        } catch (err) {
            // return (e.message)

            console.log(err)
        }
    },
}

fly.interceptors.request.use((request) => {
    let access_token = store.state.access_token
    if (access_token) {
        request.headers["Authorization"] = `Bearer ${access_token.access_token}`;
    }

  if(request.method == 'POST'){
    request.headers["Content-Type"] = 'application/json';
  }
})



export default api
