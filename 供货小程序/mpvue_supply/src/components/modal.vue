<template>
  <div class="modal">
    <div class="modal-mask"></div>
    <div class="modal-content">
      <slot name="content"></slot>
      <slot></slot>
      <div class="modal-footer">
        <slot name="footer"></slot>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['vi']
  }

</script>

<style>
  .modal {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    z-index: 100;
  }

  .modal-mask {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    background: #000;
    opacity:0.8;
    z-index: 10;
  }

  .modal-content {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 11;
  }

</style>
