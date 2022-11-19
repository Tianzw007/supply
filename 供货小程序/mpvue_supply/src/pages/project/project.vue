<template>
  <div class="container">
    <div class="project-list" v-if="newsList">
      <project-module :data="item" v-for="(item,index) in newsList" :key="index"></project-module>
    </div>
  </div>
</template>

<script>
  import {
    mapState,
    mapMutations
  } from "Vuex";
  // 依赖
  import projectModule from "@/components/projectModule";
  import request from "@/api/request";
  export default {
    data() {
      return {}
    },
    components: {
      projectModule
    },
    computed: {
      ...mapState(['newsList'])
    },
    methods: {
     ...mapMutations(['setNewsList']),
      getNewsList() {
        // 获取首页列表
        //console.log(222);
        request.getNewsList().then(res => {
          this.setNewsList(res.data)
        });
      },
    },
    mounted() {
      this.getNewsList()
    },
  }

</script>

<style lang="less">
  .project-list {
    background: #fff;

    .project {
      margin-bottom: 40/2px;
    }
  }

</style>
