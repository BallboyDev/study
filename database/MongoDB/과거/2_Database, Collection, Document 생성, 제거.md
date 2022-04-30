# Database/Collection/Document 의 생성, 제거
## DataBase 생성 : use
- use DATABASE_NAME 명령어를 사용하여 Database를 생성 할 수 있습니다.
- 생성 후, 생성된 사용된 데이터 베이스를 사용하거나, 데이터베이스가 이미 존재하는 경우에는 현존하는 데이터 베이스를 사용합니다.
~~~json
// mongodb_study라는 데이터베이스를 생성
> use mongodb_study
switched to db mongodb_study

// 현재 사용중인 데이터베이스를 확인
> db
mongodb_study

// 현재 생성되어 있는 데이터베이스 리스트를 확인
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
nodejs  0.000GB

// 내부에 데이터가 없는 DB는 리스트에 출력되지 않음
// 최소 한개 이상의 Document를 추가해야 출력이 됨
~~~

## Database 제거 : db.dropDatabase()
- Database를 제거할 땐 db.dropDatabase() 명령어를 사용합니다.
- 이 명령어를 사용하기 전, use DATABASE_NAME명령어로 삭제하고자 하는 데이터베이스를 선택해줘야 합니다.
~~~ json
// 제거할 DB 선택
> use mongodb_study
switched to db mongodb_study

// DB 삭제
> db.dropDatabase()
{ "dropped" : "mongodb_study", "ok": 1 }
~~~

## Collection 생성 : db.createCollection()
- Collection을 생성할 때는 db.createCollection(name, [option])명령어를 사용합니다.
- name은 생성하려는 Collection의 이름입니다.
- option은 document타입으로 구성된 해당 컬렉션의 설정값입니다.
    - capped : Boolean
        - 이 값을 true로 설정하면 capped collection을 활성화 시킵니다. Capped collection이란, 고정된 크기(fixed size)를 가진 컬렉션으로서, size가 초과되면 가장 오래된 데이터를 덮어씁니다.
        이 값을 true로 설정하면 size 값을 반드시 설정해야 합니다.
    - autoIndex : Boolean
        - 이 값을 true로 설정하면, _id 필드에 Index를 자동으로 생성합니다.
        - 기본값은 false입니다.
    - size : Number
        - Capped collection을 위해 해당 컬렉션의 최대 사이즈(maximum size)를 ~bytes로 지정합니다.
    - max : Number
        - 해당 컬렉션에 추가 할 수 있는 최대 갯수를 설정합니다.
~~~json
// text 데이터베이스에 books 컬렉션을 옵션 없이 생성합니다.
> use test
switched to db test
> db.createCollection("books")
{ "ok" : 1 }

// test 데이터 베이스에 articles 컬렉션을 옵션과 함께 생성합니다.
> db.createCollection("articles", {
... capped: true,
... autoIndex: true,
... size: 6142800,
... max: 10000
})
{ "ok" : 1 }

// 따로 createCollection() 메소드를 사용하지 않아도 document를 추가하면 자동으로 컬렉션이 생성됩니다.
> db.people.insert({ "name": "ballboy" })
WriteResult({ "nInserted" : 1 })

// 내가 만든 collection 리스트를 확인하려면 show collections 명령어
> show collections
articles
books
people
~~~

## Collection 제거 : db.COLLECTION_NAME.drop()
- Collection을 제거 할 때느 drop() 메소드를 사용합니다.
~~~json
// test 데이터베이스의 people 컬렉션을 제거
> use test
> db.people.drop()
true
~~~

## Document 추가 : db.COLLECTION_NAME.insert(document)
- insert() 메소드를 사용하여 Document를 추가 할 수 있습니다.
- 배열 형식의 인자를 전달해주면 여러 다큐먼트를 동시에 추가 할 수 있습니다.
~~~json
// 한 개의 document books 컬렉션에 추가합니다.
> db.books.insert({ "name": "mongoDB", "author": "Ballboy" })
WriteResult({ "nInsert" : 1 })

// 두개의 document를 books 컬렉션에 추가합니다.
> db.books.insert([
    { "name": "Book1", "author": "Ballboy" },
    { "name": "Book2", "author": "Ballboy" }
])
~~~

## Document 제거 : db.COLLECTION_NAME.remove(criteria[, justOne])
- document는 remove(criteria, justOne) 메소드를 사용하여 Document를 제거 할 수 있습니다.
- 메소드의 두 개의 변수
    - criteria : document
        - 삭제 할 데이터의 기준값입니다. 이 값이 {}이면 컬렉션의 모든 데이터를 제거합니다.
    - justOne : boolean
        - 선택적 매개변수이며 이 값이 trueaus 1개의 document만 제거합니다.
        이 매개변수가 생략되면 기본값은 false로, criteria에 해당하는 모든 document를 제거합니다.
~~~json
// books컬렉션에서 name이 Book1인 document를 제거
> db.books.remove({"name":"Book1"})
WriteResult({ "nRemoved": 1 })
~~~