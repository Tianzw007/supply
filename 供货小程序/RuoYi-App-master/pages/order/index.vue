<template>
	<view>
		<view class="uni-container">
			<uni-table ref="table" :loading="loading" border>
				<uni-tr>
					<uni-th align="center">订单编号</uni-th>
					<uni-th align="center">用户信息</uni-th>
					<uni-th align="center">订单状态</uni-th>
					<uni-th align="center">商品信息</uni-th>
					<uni-th align="center">订单总价</uni-th>
					<uni-th align="center">下单时间</uni-th>
					<uni-th align="center">操作</uni-th>
				</uni-tr>
				<uni-tr v-for="(item, index) in tableData" :key="index">
					<uni-td>{{ item.orderSn }}</uni-td>
					<uni-td>{{ item.consignee }}</uni-td>
					<uni-td>{{ item.orderStatusStr }}</uni-td>
					<uni-td align="center" style="white-space: pre-wrap;" >{{ showorder(item.storeOrderGoods) }}</uni-td>
					<uni-td>{{ item.orderAmount }}</uni-td>
					<uni-td>{{ item.addTime }}</uni-td>
					<uni-td>
						<view class="uni-group">
							<button class="uni-button" size="mini" type="primary">修改</button>
							<button class="uni-button" size="mini" type="warn">删除</button>
						</view>
					</uni-td>
				</uni-tr>
			</uni-table>
			<view class="uni-pagination-box">
				<uni-pagination show-icon :page-size="pageSize" :current="pageCurrent" :total="total"
					@change="change" />
			</view>
		</view>
	</view>
</template>

<script>
	import tableData from '@/pages/order/taebleData.js'
	import {
		getOrder
	} from '@/api/order.js'
	export default {
		data() {
			return {
				searchVal: '',
				tableData: [],
				// 每页数据量
				pageSize: 10,
				// 当前页
				pageCurrent: 1,
				// 数据总量
				total: 0,
				loading: false
			}
		},
		onLoad() {
			this.selectedIndexs = []
			this.getData(1)
		},
		methods: {
			// // 多选处理
			// selectedItems() {
			// 	return this.selectedIndexs.map(i => this.tableData[i])
			// },
			// // 多选
			// selectionChange(e) {
			// 	console.log(e.detail.index)
			// 	this.selectedIndexs = e.detail.index
			// },
			//显示订单详情
			showorder(value) {
				var str = '';
				for (var p in value) {
					str += value[p].goodsName + "(" + value[p].specKeyName + ")\n";
				}
				return str;
			},

			//批量删除
			delTable() {
				console.log(this.selectedItems())
			},
			// 分页触发
			change(e) {
				this.$refs.table.clearSelection()
				this.selectedIndexs.length = 0
				this.getData(e.current)
			},
			// 搜索
			search() {
				this.getData(1, this.searchVal)
			},
			// 获取数据
			getData(pageCurrent, value = '') {
				this.loading = true
				this.pageCurrent = pageCurrent
				// this.request({
				// 	pageSize: this.pageSize,
				// 	pageCurrent: pageCurrent,
				// 	value: value,
				// 	success: res => {
				// 		// console.log('data', res);
				// 		this.tableData = res.data
				// 		this.total = res.total
				// 		this.loading = false
				// 	}
				// });
				getOrder({
					pageSize: this.pageSize,
					pageCurrent: pageCurrent,
				}).then(res => {
					console.log(res);
					this.tableData = res.rows
					this.total = res.total
					this.loading = false
				})
			},
			// 伪request请求
			request(options) {
				const {
					pageSize,
					pageCurrent,
					success,
					value
				} = options
				let total = tableData.length
				let data = tableData.filter((item, index) => {
					const idx = index - (pageCurrent - 1) * pageSize
					return idx < pageSize && idx >= 0
				})
				if (value) {
					data = []
					tableData.forEach(item => {
						if (item.name.indexOf(value) !== -1) {
							data.push(item)
						}
					})
					total = data.length
				}

				setTimeout(() => {
					typeof success === 'function' &&
						success({
							data: data,
							total: total
						})
				}, 500)
			}
		}
	}
</script>

<style>
	<style>

	/* #ifndef H5 */
	/* page {
  	padding-top: 85px;
  } */
	/* #endif */
	.uni-group {
		display: flex;
		align-items: center;
	}
</style>
</style>
