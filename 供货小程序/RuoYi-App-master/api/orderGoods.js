import request from '@/utils/request'


// 保存订单订单信息
export function saveOrderGoods(data) {
  return request({
    'url': '/shop/orderGoods/saveOrderGoods',
    'method': 'post',
	data
  })
}

// 删除订单订单信息
export function delOrderGoods(data) {
  return request({
    'url': '/shop/orderGoods/delOrderGoods',
    'method': 'post',
	data
  })
}
