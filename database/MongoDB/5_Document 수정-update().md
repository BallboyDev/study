# Document수정 - update()
## 정의
- MongoDB에서는 update() 메소드를 통하여 데이터를 수정 할 수 있습니다.
- 예시)
~~~
db.collection.update(
    <query>,
    <update>,
    {
        upsert: <boolean>,
        multi: <boolean>,
        writeConsern: <document>
    }
)
~~~

## update()
~~~
// 특정 field 업데이트 하기
> db.tempCol.update({name: "Abet"}, {$set: {age:20}})
// 특정 field의 값을 수정 할 떈 $set 연산자를 사용합니다.
// 이 연산자를 사용해서 똑같은 방법을 새로운 field를 추가 할 수도 있습니다.

// document를 replace하기
> db.tempCol.update({name: "Betty"}, {name: "Betty 2nd", age: 1})
// 새로운 document로 replace할 때는 _id값은 바뀌지 않습니다.

// 특정 field를 제거하기 : David document의 score field 제거
> db.tempCol.update({name: "David"}, {$unset: {score:1}})

// criteria에 해당되는 document가 존재하지 않는다면 새로 추가하기
// upsert 옵션을 설정하여 Elly document가 존재하지 않으면 새로 추가
> db.tempCol.update({name: "Elly"}, {name: "Elly", age:17}, {upsert: true})

// 여러 document의 특정 field를 수정하기
// age가 20보다 낮거나 같은 document의 score를 10으로 수정
> db.tempCol.update(
    {age: {$lte: 20}},
    {$set: {score: 10}},
    {multi: true}
)

// 배열에 값 추가하기
// Charlie document의 skills배열에 "reactjs" 추가
> db.tempCol.update(
    {name: "Charlie"},
    {$push: {skills: "reactjs"}}
)

// 배열에 값 여러개 추가하기 + 오름차순으로 정렬하기
> db.tempCol.update(
    {name: "Charlie"},
    {
        $push: {
            skills: {
                $each: ["c++", "java"],
                $sort: 1
            }
        }
    }
)
// $sort 값을 내림차순으로 정렬하려면 -1로 설정
// 배열이 document의 배열이고 그 embedded document의 특정 field에 따라서 정렬을 할 때는 다음과 같이 설정 하면 됩니다.
// $sort: {key:1}

// 배열에 값 제거하기
// Charlie document에서 skills 값의 mongodb 제거
> db.tempCol.update(
    {name: "Charlie"},
    {$pull: {skills: "mongodb"}}
)

// 배열에서 여러 값 제거하기
// Charlie document에서 skills 배열중 "reactjs"와 "java" 값 제거
> db.tempCol.update(
    {name:"Charlie"},
    {
        $pull: {skills: {$in: ["reactjs", "java"]}}
    }
)
~~~