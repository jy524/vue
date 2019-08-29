var fs = require('fs');

var data = fs.readFileSync('1.txt');

console.log('同步获取数据', data.toString());

fs.readFile('1.txt', function(err, data) {
    if (err) return console.error(err);
    console.log('异步获取数据', data.toString());
})

console.log('程序执行结束');