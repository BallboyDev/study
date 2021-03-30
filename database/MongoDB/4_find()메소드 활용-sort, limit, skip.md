# find()메소드 활용 - sort(), limit(), skip()
- find() 메소드를 사용 했을시 cursor 형태의 결과값을 반환합니다. 이 객체가 가지고 있는 limit()메소드와 skip() 메소드를 통하여 보이는 출력물의 갯수를 제한 할 수 있고, sort() 메소드를 사용하여 데이터를 순서대로 나열할 수 있습니다.

## sort(Document)
- 이 메소드는 데이터를 정렬 할 때 사용됩니다. 매개변수로는 어떤 key를 사용하여 정렬 할 지 알려주는 document를 전달합니다.
- key는 데이터의 field 이름이고, value의 값은 1 혹은 -1 입니다.
1로 설정하면 오름차순으로, -1로 설정하면 내림차순으로 정렬합니다.
- 또한 여러 key를 입력 할 수 있고 먼저 입력한 key가 우선권을 갖습니다.
~~~
// _id의 값을 사용하여 오름차순으로 정렬하기
> db.tempCol.find().sort({"-_id":1})

// amount 값을 사용하여 오름차순으로 정렬하고, 정렬한 값에서 id값은 내림차순으로 정렬하기
> db.tempCol.find().sort({"amount":1, "_id":-1})
~~~

## limit(value)
- limit()메소드는 출력할 데이터 갯수를 제한할 때 사용됩니다.
- value 파라미터는 출력 할 갯수 값 입니다.
~~~
// 출력 할 갯수를 3개로 제한하기
> db.tempCol.find().limit(3)
~~~

## skip(value)
- skip()메소드는 출력 할 데이터의 시작부분을 설정 할 떄 사용됩니다.
- value 값 갯수의 데이터를 생략하고 그 다음부터 출력합니다.
~~~
// 2개의 데이터를 생략하고 그 다음부터 출력
> db.tempCol.find().skip(2)
~~~

## 응용
~~~
// order를 최신순으로 한 페이지당 2개씩 나타냅니다.
> let showPage = (page) => {
    return db.tempCol.find().sort({_id:-1}).skip((page - 1) * 2).limit(2);
}
~~~