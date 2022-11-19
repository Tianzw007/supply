<template>
  <div class="banner">
    <!-- <div v-if="videos">
      <div class="banner-item banner-video" v-if="bannerStatus=='video'">
        <div class="controls" v-if="!play">
          <div class="icon-warp" @click="playStart">
            <i-icon i-class="i-icon" type="play_fill" size="32" color="#fff" />
          </div>
          <img class="img" v-if="type!='info'"  :src='imgs[0].url' />
          <img class="img" v-if="type=='info'"  :src="imgs" />
        </div>
        <video id="video" @pause="playEnd" @play="playStart" controls :src="type!='info'?videos.url:videos" :class="{'banner-video':play,'banner-hide':!play}"
          objectFit="cover"></video>
      </div>
    </div> -->
    <div v-if="imgs">
      <div class="banner-item banner-pic" v-if="bannerStatus=='pic'&&type!='info'">
        <swiper class="banner-swiper" :indicator-dots="indicatorDots" indicator-color="rgba(255,255,255,1)"
          indicator-active-color="rgba(238,117,89,1)" :autoplay="autoplay" :interval="interval" :duration="duration">
          <block v-for="item in imgs" :key="item.url">
            <swiper-item>
              <image :src="item.url" class="banner-pic" mode="scaleToFill" />
            </swiper-item>
          </block>
        </swiper>
      </div>
      <div class="banner-item banner-pic" v-if="bannerStatus=='pic'&&type=='info'">
        <image :src="imgs" class="banner-pic" mode="aspectFit" />
      </div>
    </div>
    <!-- <div class="banner-tabs">
      <button class="banner-tabs-item" v-if="video" @click="changeBannerStatus('video')" :class="{'active':bannerStatus=='video'}">视频</button>
      <button class="banner-tabs-item" v-if="imgs" @click="changeBannerStatus('pic')" :class="{'active':bannerStatus=='pic'}">图片</button>
    </div> -->
  </div>
</template>

<script>
  import {
    mapState
  } from "Vuex";
  // 依赖
  export default {
    props: ["type", "videos", "imgs"],
    data() {
      return {
        bannerStatus: "pic",
        indicatorDots: true,
        autoplay: true,
        interval: 5000,
        duration: 300,
        play: false
      };
    },
    methods: {
      playStart() {
        console.log("开始了")
        this.videoContext.play();
        this.play = true;
      },
      playEnd() {
        console.log("暂停了")
        this.videoContext.pause();
        this.play = false;
      },
      changeBannerStatus(type) {
        this.bannerStatus = type;
        this.playEnd();
      }
    },
    mounted() {
      console.log(this.videos);
      console.log(this.imgs);
      // this.videos ? this.bannerStatus = 'video' : this.bannerStatus = 'pic'
      this.videoContext = wx.createVideoContext("video");
    }
  };

</script>

<style lang="less">
  .controls {
    display: block;
    position: relative;

    .icon-warp {
      width: 44px;
      height: 44px;
      position: absolute;
      top: 50%;
      left: 50%;
      z-index: 99;
      margin-left: -22px;
      margin-top: -22px;
      background: rgba(0, 0, 0, 0.4);
      border: 1px solid rgba(255, 255, 255, 0.5);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .img {
      width: 100%;
      height: 180px;
    }
  }

  .banner {
    font-size: 0;
    width: 100%;
    background: #ccc;
    position: relative;

    img {
      width: 100%;
    }
  }

  .banner-tabs {
    width: auto;
    z-index: 99;
    position: absolute;
    bottom: 12/2px;
    left: 50%;
    transform: translate(-50%, 0);
    display: flex;
    align-items: center;

    .banner-tabs-item {
      margin: 10/2px;
      width: 78/2px;
      height: 40/2px;
      border-radius: 20/2px;
      font-size: 18/2px;
      line-height: 40/2px;
      padding: 0;
      text-align: center;
      color: rgba(238, 117, 89, 1);
      background: #fff;
    }

    .active {
      background: rgba(238, 117, 89, 1);
      color: #fff;
    }
  }

  .banner-swiper {
    height: 180px;

  }

  .banner {
    font-size: 0;
    width: 100%;
    background: #ccc;
    position: relative;
    height: 180px;

    img {
      width: 100%;
    }

    .banner-video {
      position: relative;
      width: 100%;
      height: 180px;
      z-index: 1;
    }

    .banner-hide {
      width: 0;
      height: 0;
      opacity: 0;
      overflow: hidden;
    }

    .banner-pic {
      width: 100%;
      height: 180px;
    }
  }

</style>
