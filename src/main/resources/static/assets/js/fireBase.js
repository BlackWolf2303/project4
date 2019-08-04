var app_fireBase = {};

(function(){
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyB4u0dFZXMSyTqe4A2Q48QeMtuSo3yOalc",
    authDomain: "doan4-fcc6c.firebaseapp.com",
    databaseURL: "https://doan4-fcc6c.firebaseio.com",
    projectId: "doan4-fcc6c",
    storageBucket: "",
    messagingSenderId: "219010837716",
    appId: "1:219010837716:web:7e1ab80ed15add28"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  app_fireBase = firebase;
})()