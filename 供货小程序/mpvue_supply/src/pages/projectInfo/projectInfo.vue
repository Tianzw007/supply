<template>
  <div class="container">
    <div class="project" v-if="data">
      <div class="project-info">
        <p class="project-title">{{data.title}}</p>
        <p class="project-date">{{data.digest}}</p>
        <div class="project-pic">
          <img mode="widthFix" class="product-controller-icon" :src="data.localUrl">
        </div>
        <div class="project-describe-info">
          <img mode="widthFix" :src="item" v-for="(item,index) in content" :key="index" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  // 依赖
  import request from "@/api/request";
  import store from '@/store/index'
  export default {
    data() {
      return {
        data: null,
        content: []
      }
    },
    methods: {
      getContent() {
        this.content = this.data.content.match(/http\S+([\.jpg][\.png])+/g)
      },
      getNewsDetail() {
        request.getNewsDetail({
          id: this.$route.query.id
        }).then(res => {
          this.data = res.data
          this.getContent()
        });
      },
    },
    mounted() {
      let access_token = store.state.access_token
      if(!access_token){
        this.$router.replace({
          path: '/pages/authorization/authorization'
        })
      }
      this.getNewsDetail()
    },
  }

</script>

<style lang="less">
  .project {
    font-size: 0;
    padding: 0 30/2px;
    background: #fff;
    flex: 1;

    .project-pic {
      width: 100%;

      img {
        width: 100%;
      }
    }

    .project-info {
      display: flex;
      flex-direction: column;
    }

    .project-title {
      font-size: 17px;
      color: rgba(96, 96, 96, 1);
      line-height: 1em;
      margin-top: 15px;
    }

    .project-date {
      margin-top: 25px;
      margin-bottom: 38px;
      font-size: 13px;
      color: rgba(160, 160, 160, 1);
      line-height: 1em;
    }

    .project-describe {
      margin-top: 10px;
      font-size: 13px;
      color: rgba(160, 160, 160, 1);
      line-height: 18px;
    }

    .project-describe-info {
      margin-top: 10px;
      font-size: 0;
      color: rgba(160, 160, 160, 1);
      img{
        width: 100%;
      }
      p {
        margin-top: 10px;
        font-size: 13px;
        color: rgba(160, 160, 160, 1);
        line-height: 18px;
        text-indent: 2em;
      }
    }
  }

</style>
