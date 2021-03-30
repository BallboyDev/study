# Document Query(조회) - find()
## Document 조회 : db.COLLECTION_NAME.find(query, projection)
- option
    - query : document
        - Optional. 도큐먼트를 조회할 때 기준을 정합니다. 기준이 없이 컬렉션에 있는 모든 도큐먼트를 조회 할 때는 이 매개변수를 비우거나 {}를 전달하세요
    - projection : document
        - Optional, 도큐먼를 조회 할 때 보여질 field를 지정합니다.

### 반환값(return)
- criteria에 해당하는 Document들을 선택하여 cursor를 반환합니다. cursor는 query 요청의 결과값을 가르키는 pointer 입니다. cursor 객체를 통하여 보이는 데이터의 수를 제한할 수 있고, 데이터를 sort할 수 도 있습니다.
- 이는 10분동안 사용되지 않으면 만료 됩니다.

~~~
> collection tempCol 생성

// 모든 도큐먼트 조회
> db.tempCol.find()

// 도큐먼를 깔끔하게? 조회
> db.tempCol.find().pretty()

// writer 값이 "ballboy" 인 document 조회
> db.tempCol.find({"writer":"ballboy"}).pretty()

// likes 값이 30이하인 Document 조회
> db.tempCol.find({"likes": {$lte: 30}}).pretty()

// likes 값이 10보다 크고 30보다 작은 document
> db.tempCol.find({"like": {$gt: 10, $lt: 30}})

// writer 값이 배열 ["Alpha", "Bravo"]안에 속하는 Document
> db.tempCol.find({"writer":{$in: ["Alpha", "Bravo"]}})

// title 값이 article01이거나, writer 값이 Alpha
> db.tempCol.find($or:[{"title": "article01"}, {"writer": "Alpha"}])

// writer 값이 "ballboy"이고 likes 값이 10 미만
> db.tempCol.find({$and: [{"writer": "ballboy"}, {"like": {$lt: 10}}]})
> db.tempCol.find({"writer": "ballboy", "like": {$lt: 10}})
~~~

### 연산자
|operator   |desc|
|:--        |:--|
|비교 연산자    ||
|$eq        |(equals)주어진 값과 일치|
|$gt        |(greater than)주어진 값 초과|
|$gte       |(greater than or equals)주어진 값 이상|
|$lt        |(less then)주어진 값 미만|
|$lte       |(less then or equals)주어진 값 이하|
|$ne        |(not equals)주어진 값과 불일치|
|$in        |(in)주어진 배열 안에 속함|
|$nin       |(not in)주어진 배열에 속하지 않음|
|논리 연산자    ||
|$or        |주어진 조건중 하나라도 true 일 때 false|
|$and       |주어진 모든 조건이 true 일 때 true|
|$not       |주어진 조건이 false 일 때 true|
|$nor       |주어진 모든 조건이 false 일 때 true|

### $regex 연산자
- $regex 연산자를 통하여 Document를 정규식을 통해 찾을 수 있습니다.
- 사용법
~~~
{ <field>: {$regex: /pattern/, $options: '<options>'} }
{ <field>: {$regex: 'pattern', $options: '<options>'} }
{ <field>: {$regex: /pattern/<options>} }
{ <field>: /pattern/<options> }
~~~
- 4번째 라인처럼 $regex를 작성하지 않고 바로 정규식을 쓸 수도 있습니다.
- $options
    - i : 대소문자 무시
    - m : 정규식에서 anchor(^)를 사용할 때 값에 \n이 있다면 무력화
    - x : 정규식 않에 있는 whitespace를 모두 무시
    - s : dot(.) 사용 할 때 \n을 포함해서 매치

~~~
// 정규식 article0[1-2]에 일치하는 값이 title에 있는 Document 조회
> db.tempCol.find({"title": /article0[1-2/})
~~~

### $where 연산자
- $where 연산자를 통하여 javascript expression을 사용할 수 있습니다.
~~~
// comments field 가 비어 있는 document 조회
> db.tempCol.find({ $where: "this.comments.length == 0" })
~~~

### $elemMatch 연산자
- $elemMatch 연산자는 Embedded Documents 배열을 쿼리 할 때 사용됩니다.
~~~
// comments 중 "Charlie" 가 작성한 덧글이 있는 Document 조회
> db.tempCol.find({"domments": {$elemMatch: {"name":"Charlie"}}})

// Embedded Document 배열이 아니라 한개의 Embedded document 일 시에는 다음과 같이 쿼리를 작성합니다.
> db.users.find({"name.first": "M.J.K"})

// Document의 배열이 아니라 그냥 배열일 시에는 다음과 같이 query를 작성합니다.
> db.users.find({"language": "korean"})
~~~

## projection
- projection은 쿼리의 결과값에서 보여질 field를 정의 합니다.
~~~
// tempCol 의 title과 content만 조회
> db.tempCol.find({}, {"_id":false, "title":true, "content": true})
~~~

### $slice 연산자
- projection 연산자 중 $slice 연산자는 Embedded Document 배열을 읽을 때 limit 설정을 합니다.
~~~
// title 값이 article03 인 Document에서 comments은 하나만 보이게 출력
> db.tempCol.find({"title":"article03"}, {comments: {$slice: 1}})
~~~

### $elemMatch 연산자
- query 연산자 중 $elemMatch와 사용법은 같습니다. 단 역할이 다릅니다.
~~~
// comments중 "Charlie"가 작성한 덧글이 있는 Document중 제목, 그리고 Charlie의 덧글만 조회
> db.tempCol.find(
    {
        "comments": {
            $elemMatch: {"name":"Charlie"}
        }
    }, 
    {
        "title": true,
        "comments": {
            $elemMatch :{"name":"Charlie"}
        },
        "comments.name":true,
        "comments.message":true
    }
)
~~~