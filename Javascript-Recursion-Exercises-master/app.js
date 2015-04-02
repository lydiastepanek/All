'user strict'

// my uniq
// arr[arr.length] = value
var arr = ["lydia", "jasmine", "donald", "lydia"];

var uniq = function(arr) {
  var newArr = [];
  for (var i = 0; i < arr.length; i++ ) {
    var unique = true
    for (var j = 0; j < newArr.length; j++) {
      if( arr[i] === newArr[j] ) {
        unique = false
      };
    };
    if (unique) {
      newArr[newArr.length] = arr[i];
    };
  };
  return newArr
};


// console.log(uniq(arr))
// two sum


var arr = [1,2,5,-4,4,-2,-1]

var twoSum = function(arr) {
  var newArr = []
  for (var i = 0; i < arr.length - 1; i ++) {
    for (var j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0) {
        newArr.push([i,j])
      }
    }
  }
  return newArr
};

// console.log(twoSum(arr))

var rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];

var myTranspose = function(rows){
  var newArray = []

  for ( i = 0; i < rows.length; i++) {
    newArray.push([]);
  }

  for ( i = 0; i < rows.length; i++) {
    var rowLength = rows[i].length;
    var row = rows[i];
    for ( j = 0; j < row.length; j++) {
      newArray[j].push(row[j])
    };
  };
  return newArray
};

// console.log(myTranspose(rows))

// my_each
arr = [1,2,3,4,5]

var addTwo = function(num) {
  console.log(num + 2)
}

var myEach = function(arr, fun) {
  for (var i = 0; i < arr.length; i++ ) {
    fun(arr[i]);
  };
  return arr
};

// myEach(arr, addTwo)
// mymap

var addTwo = function(num) {
  return num + 2
}

var myMap = function(arr, fun) {
  newArr = []
  var addToArray = function(val) {
    newArr.push(fun(val));
  }
  var result = myEach(arr, addToArray);
  return newArr;
}

// console.log(myMap(arr, addTwo))



var fun = function(accum, element) {
  return accum * element
}
arr = [0,1,2,3,4,5]
//myinject

// var myEach = function(arr, fun) {
//   for (var i = 0; i < arr.length; i++ ) {
//     fun(arr[i]);
//   };
//   return arr
// };

var myInject = function(arr, fun) {
  var accum = undefined;
  var doIteratively = function(val) {
    if (!accum && accum !== 0){
      accum = val;
    }
    else {
      accum = fun(accum, val);
    }
  };
  myEach(arr, doIteratively);
  return accum;
}

// console.log(myInject(arr, fun))





//BUBBLE SORT

var arr = [1,700,6,345,89];

var bubble = function(arr) {
  "use strict";
  var c;
  var sorted = false;
  while (!sorted) {
    sorted = true;
    for (var i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        sorted = false;
        c = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = c;
      }
    }
  }
  return arr
}

// console.log(bubble(arr))

// substrings

var string = "hell"

var substrings = function(string) {
  arr = ['']
  for (var i = 0; i <= string.length; i++) {
    for (var j = i + 1; j <= string.length; j++) {
        arr.push(string.substring(i,j))
      }
  }
  return arr
};

// console.log(substrings(string))

//RANGE

var range = function(start, end) {
  if (start < end) {
    var arr = [start];
    var nums = range(start + 1, end)
    arr = arr.concat(nums);
  }
  else {
    console.log("else")
    return [end]
  }
  return arr;
}

// console.log(range(1,5))

// # recursion 1
// exp(b, 0) = 1
// exp(b, n) = b * exp(b, n - 1)
//
// # recursion 2
// exp(b, 0) = 1
// exp(b, 1) = b
// exp(b, n) = exp(b, n / 2) ** 2             [for even n]
// exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


var exp1 = function(num, exp) {
  if (exp === 0) {
    return 1
  }
  else {
    var total = num * exp1(num, exp - 1)
  }
  return total;
}

// console.log(exp1(3,4))

var exp2 = function(num, exp) {
  if (exp === 0) {
    return 1
  }
  else if (exp % 2 === 0) {
    var call = exp2(num, exp / 2)
    var total = call * call
  }
  else {
    var call = exp2(num, (exp - 1) / 2)
    var total = num * call * call
  }
  return total
}

// console.log(exp2(3,4))

//DEEP DUP

var dup = function(arr) {
  var newArr = []
  arr.forEach(function (el){
    if (!Array.isArray(el)) {
      var duped = el
    }
    else {
      var duped = dup(el)
    }
    newArr.push(duped)
  })
  return newArr
}

// console.log(dup([1,2,3,[4,5,[6,7]]]))

//FIBONACCI

var fibs = function(n) {
  if (n === 1) {
    return [0]
  }
  else if (n === 2) {
    return [0,1]
  }
  else if (n <= 0) {
    return []
  }
  else {
    var fibNums = fibs(n-1)
    var len = fibNums.length
    fibNums[len] = fibNums[len - 1] + fibNums[len - 2]
  }
  return fibNums
}

// console.log(fibs(0))


var binary = function(arr, target) {
  var midIndex = Math.floor(arr.length / 2);
  if (arr.length === 0) {
    return null;
  }
  else if (arr[midIndex] === target) {
    return midIndex;
  }
  else if (arr[midIndex] > target) {
    var newArray = arr.slice(0,midIndex);
    // console.log(arr.slice(0,midIndex))
    return binary(newArray, target);
  }
  else {
    var newArray = arr.slice( midIndex + 1, arr.length );
    // console.log(arr.slice(midIndex + 1, arr.length))
    return midIndex + 1 + binary(newArray, target);
  }


}
// console.log(binary([], 1));
// console.log(binary([1, 2, 3], 1));
// console.log(binary([2, 3, 4, 5], 3));
// console.log(binary([2, 4, 6, 8, 10], 6));
// console.log(binary([1, 3, 4, 5, 9], 5));
// console.log(binary([1, 2, 3, 4, 5, 6], 6));
// console.log(binary([1, 2, 3, 4, 5, 6], 0));
// console.log(binary([1, 2, 3, 4, 5, 7], 6));
// console.log(binary([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17], 15))



//MAKE CHANGE

var makeChange = function(val, arr) {
  if (val === 0) { return [] }
  var coin = arr.shift();
  var coins = [];
  var numCoin = Math.floor(val / coin);
  for (var i = 0; i < numCoin; i ++) {
    coins.push(coin);
  };
  val -= coin * numCoin;
  var smallCoins = makeChange(val, arr);
  return coins.concat(smallCoins)
}

// console.log(makeChange(14, [10, 7, 1]))

var makeChange2 = function(val, arr) {
  if (val === 0) { return [] }
  var coin = arr[0];
  var coins = [];
  if (val > coin) {
    coins.push(coin);
    val -= coin;
  }
  else {
    coins.shift
  }
  var smallCoins = makeChange(val, arr);
  return coins.concat(smallCoins)
}

// console.log(makeChange2(34, [10, 7, 1]))

// var makeChange = function(val, arr) {
//   if (val === 0) { return [] }
//   var coins = [];
//   var smallCoins = [];
//   var coinSets = [];
//   console.log ("val",val);
//
//   arr.forEach(function (el){
//     newArr = dup(arr)
//     // console.log("el: " + el)
//     var coin = el
//
//     if (val >= coin) {
//       coins.push(coin);
//       var newVal = val - coin;
//     }
//     else {
//       // console.log("Else")
//       newArr.shift()
//     var newVal = val
//     }
//     // console.log(newVal, arr)
//     console.log("input", newVal, newArr)
//     smallCoins = makeChange(newVal, newArr);
//     console.log("vars", smallCoins, coins)
//     coins.concat(smallCoins)
//     // console.log ("smallcoin: ", smallCoins)
//     coinSets.push(smallCoins)
//   })
//   console.log("sets", coinSets)
//   while (coinSets.length > 1) {
//     if (coinSets[0].length < coinSets[1].length && coinSets[0].length !== 0) {
//       coinSets.splice(1,1);
//     }
//     else {
//       coinSets.shift()
//     }
//   }
//   return coinSets[0]
//
// //  var smallCoins = makeChange(val - coin, arr);
// }


var makeChange = function(val, arr) {
  // console.log ("start", val, arr)
  if (val === 0) { return [] }
  var smallCoins = []
  var coinSets = [];

  // console.log ("val", val)

  // console.log("before loop")
  arr.forEach(function (el, i){
    var coins = [];
    var newVal = val
    // console.log(el)
    var coin = el;
    var newArr = dup(arr)
    if (val >= coin) {
      // console.log ("if")
      coins.push(coin);
      newVal = val - coin;
      smallCoins = makeChange(newVal, newArr.slice(i,newArr.length));
      coins = coins.concat(smallCoins)
      coinSets.push(coins)
      console.log(coinSets)
    }
    else {

    }
  })
  var minArray = coinSets[0]
  for(var i = 0; i < coinSets.length; i++) {
    if (minArray.length > coinSets[i].length) {
      minArray = coinSets[i];
    }
  }
  // smallCoins = coins.concat(makeChange(newVal, newArr));
  // for (var )
  // console.log(smallCoins)
  // return smallCoins
  return minArray
}


// console.log(makeChange(14, [10, 7, 1]))







var makeChange = function(target, coins) {
  if (target === 0) { return [] }
  var bestCoins = null;

  coins.forEach(function (coin, i){
    if (coin > target) {
      return
    };
    var remainder = target - coin;
    var currentCoins = [coin];
    var remainderCoins = makeChange(remainder, coins.slice(i));
    currentCoins = currentCoins.concat(remainderCoins);
    if (!bestCoins || currentCoins.length < bestCoins.length) {
      bestCoins = currentCoins
    }
  });
  console.log(bestCoins)
  return bestCoins;
}

console.log(makeChange(56, [10, 7, 1]))















































//
