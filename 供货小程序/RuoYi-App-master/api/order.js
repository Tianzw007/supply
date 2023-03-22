import request from '@/utils/request'


// 获取订单信息
export function getOrder(data) {
  return request({
    'url': '/shop/order/list',
    'method': 'post',
	data
  })
}