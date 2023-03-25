<template>
	<view>
		<view class="uni-container">
			<uni-table ref="table" :loading="loading" border>
				<uni-tr>
					<uni-th align="center" width="90">商品名称</uni-th>
					<uni-th align="center" width="60">单价</uni-th>
					<uni-th align="center" width="100">商品规格</uni-th>
					<uni-th align="center">操作</uni-th>
				</uni-tr>
				<uni-tr v-for="(item, index) in tableData" :key="index">
					<uni-td align="center" >{{ item.goodsName }}</uni-td>
					<uni-td align="center" >{{ item.goodsPrice }}</uni-td>
					<uni-td align="center" >{{ item.specKeyName }}</uni-td>
					<uni-td width="180">
						<view class="uni-group">
							<button class="uni-button" size="mini" type="primary" @click="change">修改</button>
							<button class="uni-button" size="mini" type="warn" @click="">删除</button>
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
	import {
		getOrder,
		getStoreOrder
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
				loading: false,
				orderId: ''
			}
		},
		onLoad() {
			this.orderId=this.$route.query.id;
			this.selectedIndexs = []
			this.getData(1)
		},
		methods: {
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
				getStoreOrder({
					pageSize: this.pageSize,
					pageCurrent: pageCurrent,
					orderId:this.orderId
				}).then(res => {
					console.log(res);
					this.tableData = res.rows
					this.total = res.total
					this.loading = false
				})
			},

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
