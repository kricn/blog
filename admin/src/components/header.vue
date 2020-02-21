<template lang="html">
  <div class="header">
    header
  </div>
</template>

<script>
export default {
  data(){
    return {
      isActive: 1
    }
  },
  methods: {
  }
}
</script>

<style lang="less" scoped>
// .header{
//   height: 110px;
//   background: #999;
//   display: flex;
//   align-items: center;
//   >ul{
//     width: 100%;
//     padding-left: 20px;
//     >li{
//       height: 40px;
//       float: left;
//       margin: 0 20px;
//       >a{
//         display: flex;
//         align-items: center;
//         justify-content: center;
//         width: 80px;
//         height: 100%;
//         border: 1px solid #fff;
//         &.active{
//           background: #333;
//         }
//       }
//     }
//   }
// }
</style>
