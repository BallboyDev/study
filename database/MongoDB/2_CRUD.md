# MongoDB 셸 경험하기
~~~
// testDB를 세팅한다.
> use testDB

// {x:1} 도규먼트를 myCollection에 집어 넣는다.
> db.myCollection.insertOne({x:1})

// 현제 세팅된 테이터베이스
> db

// 데이터 베이스 목록
> show dbs

// 세팅된 데이터 베이스 안에 있는 컬렉션 목록
> show collections
~~~

## 데이터 베이스와 컬렉션의 삭제와 수정
- db.dropDatabase()
    - 현재 데이터베이스를 삭제한다. 이 작업 중에는 글로벌 쓰기 Lock이 걸린다.
- db.collection.drop()
    - collection을 삭제한다. 파라미터로 WriteConsern을 넘길 수 있다.
- db.collection.renameCollection(바꿀 이름)
    - collection의 이름을 받은 파라미터로 변경한다.
- db.createCollection(<컬렉션 이름>, { capped: true, size: <제한할 크기> })
    - Capped 컬렉션은 size파라미터의 크기가 다 찼을 경우 자동으로 오래된 도큐먼트 부터 삭제 한다.

