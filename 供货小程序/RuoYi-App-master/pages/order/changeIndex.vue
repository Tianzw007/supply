<template>
	<view>
		<view class="uni-container">
			<uni-table ref="table" :loading="loading" border>
				<uni-tr>
					<uni-th align="center" width="90">商品名称</uni-th>
					<uni-th align="center" width="60">单价</uni-th>
					<uni-th align="center" width="60">数量</uni-th>
					<uni-th align="center" width="80">商品规格</uni-th>
					<uni-th align="center" width="50">操作</uni-th>
				</uni-tr>
				<uni-tr v-for="(item, index) in tableData" :key="index">
					<uni-td align="center">{{ item.goodsName }}</uni-td>
					<uni-td align="center" v-if="!changeEdit">{{ item.goodsPrice }}</uni-td>
					<uni-td v-else>
						<input class="uni-input" v-model="item.goodsPrice" type="number"
							@input="fpNumInput($event,item.goodsPrice)" placeholder="请输入价格" />
					</uni-td>
					<uni-td align="center" v-if="!changeEdit">{{ item.goodsNum }}</uni-td>
					<uni-td v-else>
						<input class="uni-input" v-model="item.goodsNum" type="number"
							@input="fpNumInput($event,item.goodsNum)" placeholder="请输入数量" />
					</uni-td>
					<uni-td align="left">{{ item.specKeyName }}</uni-td>
					<uni-td>
						<view class="uni-group" v-if="!changeEdit">
							<button class="uni-button" size="mini" type="primary" @click="changeGood">修改</button>
							<button class="uni-button" size="mini" type="warn" @click="del(item,index)">删除</button>
						</view>
						<view class="uni-group" v-else>
							<button class="uni-button" size="mini" type="primary"
								@click="saveGood(item, index)">保存</button>
							<button class="uni-button" size="mini" type="warn" @click="cancel(item, index)">取消</button>
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
	import {
		saveOrderGoods,
		delOrderGoods
	} from '@/api/orderGoods.js'
	export default {
		data() {
			return {
				changeEdit: false,
				searchVal: '',
				tableData: [],
				tableDataBak: [],
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
			this.orderId = this.$route.query.id;
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
					orderId: this.orderId
				}).then(res => {
					console.log(res);
					this.tableData = res.rows
					this.tableDataBak = JSON.parse(JSON.stringify(res.rows));
					this.total = res.total
					this.loading = false
				})
			},
			changeGood() {
				this.changeEdit = !this.changeEdit;
			},
			saveGood(item, index) {
				let good = JSON.parse(JSON.stringify(item));
				good.oldGoodsNum = this.tableDataBak[index].goodsNum;
				good.oldGoodsPrice = this.tableDataBak[index].goodsPrice;
				saveOrderGoods(good).then(res => {
					console.log(res);
					if (res.code == 0) {
						uni.showToast({
							title: '保存成功'
						});
						this.changeEdit = !this.changeEdit;
					}
				})
			},
			fpNumInput(e, val) {
				// const o = e.target;
				// const inputRule =/[^\d.]/g
				// this.$nextTick(function() {
				// 	val = o.value.replace(inputRule, '');
				// })
			},
			cancel(item, index) {
				item.goodsPrice = this.tableDataBak[index].goodsPrice;
				item.goodsNum = this.tableDataBak[index].goodsNum;
				this.changeEdit = !this.changeEdit;
			},
			del(item, index) {
				delOrderGoods(item).then(res => {
					console.log(res);
					if (res.code == 0) {
						uni.showToast({
							title: '删除成功'
						});
						this.tableData.splice(index,1);
					}
				})
			},
		}
	}
</script>


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

	/deep/ .uni-input-input {
		color: #0055ff !important;
		font-size: 40rpx;
	}
</style>
