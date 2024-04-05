// index.js
Page({
  data: {
    msg: 'hello world',
    avatarUrl: '',
    nickName: '',
    code: '',
    result: ''
  },
  getUserInfo: function () {
    wx.getUserProfile({
      desc: '获取用户信息',
      success: (res) => {
        console.log(res)
        this.setData({
          avatarUrl: res.userInfo.avatarUrl,
          nickName: res.userInfo.nickName
        })
      }
    })
  },
  wxlogin: function () {
    wx.login({
      success: (res) => {
        console.log("授权码：" + res.code)
        this.setData({
          code: res.code
        })
      }
    })
  },
  sendRequest: function () {
    wx.request({
      url: 'http://localhost:8080/user/shop/status',
      method: 'GET',
      success: (res) => {
        console.log("响应结果：" + res.data.data)
        this.setData({
          result: res.data.data
        })
      }
    })
  }
})