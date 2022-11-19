<template>
  <div class="project" @click="$router.push({ path: '/pages/projectInfo/projectInfo', query: { id: data.id } })">
    <div class="project-pic">
      <img mode="widthFix" class="product-controller-icon" :src="data.localUrl">
    </div>
    <div class="project-info">
      <p class="project-title">{{data.title}}</p>
      <p class="project-describe">{{data.digest}}</p>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['data'],
  }

</script>

<style lang="less">
  .project {
    font-size: 0;
    padding: 0 30/2px;

    .project-pic {
      width: 100%;

      img {
        width: 100%;
        height: auto;
      }
    }

    .project-info {
      display: flex;
      flex-direction: column;
    }

    .project-title {
      font-size: 14px;
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
      font-size: 12px;
      color: rgba(160, 160, 160, 1);
      line-height: 18px;
    }

    .project-describe-info {
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
