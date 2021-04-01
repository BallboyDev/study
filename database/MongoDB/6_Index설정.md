# Index 설정
## Index란?
- index가 설정된 도큐먼트의 필드의 데이터 키값을 가지고 document들을 가르키는 포인터값으로 이뤄진 B-Tree 를 만듭니다. 그리고 데이터 조회시 B-Tree의 Binary Search를 통하여 쿼리 속도를 매우 빠르게 향상 시킬수 있습니다.

## Index의 종류
- __기본 인덱스 _id__
    - 모든 MongoDB의 컬렛견은 기본적으로 _id필드에 인덱스가 존재합니다.
    만약에 컬렉션을 만들 때 _id 필드를 따로 지정하지 않으면 mongod드라이버가 자동으로 _id 필드 값을 ObjectId로 설정해줍니다.
    _id 인덱스는 unique하고 이는 mongodb 클라이언트가 같은 _id를 가진 문서를 중복적으로 추가하는 것을 방지합니다.

- __Single(단일) 필드 인덱스__
    - MongoDB 드라이버가 지정하는 _id 인덱스 외에도, 사용자가 지정 할 수 있는 단일 필드 인덱스가 있습니다.

- __Compound 필드 인덱스__
    - 두개 이상의 필드를 사용하는 인덱스를 복합 인덱스라고 부릅니다.

- __Multikey 인덱스__
    - 필드 타입이 배열인 필드에 인덱스를 적용 할 때는 MultiKey 인덱스가 사용됩니다. 이 인덱스를 통하여 배열에 특정값이 포함되어 있는 document를 효율적으로 스캔 할 수 있습니다.

- __Geospatial(공간적) Index__
    - 지도의 좌표와 같은 데이터를 효율적으로 쿼리하기 위해서(ex. 특정 좌표 반경 x에 해당되는 데이터를 찾을 때)사용되는 인덱스 입니다.

- __Text 인덱스__
    - 텍스트 관련 데이터를 효율적으로 쿼리하기 위한 인덱스 입니다.

- __Hash 인덱스__
    - 이 인덱스를 사용하면 B-Tree가 아닌 Hash 자료 구조를 사용합니다.
    Hash는 검핵 효율이 B-Tree보다 좋지만, 정렬을 하지 않습니다.

## 인덱스 생성
- 인덱스를 생성 할 땐, 다음과 같은 createIndex()메소드를 사용합니다. 파라미터는 인덱스를 적용할 필드를 전달합니다. 값을 1로 하면 오름차순으로, -1로 하면 내림차순으로 정렬합니다.
~~~
> db.COLLENCTION.createIndex({key: 1})

// 단일 필드 인덱스 생성
> db.report.createIndex({score: 1})
// db.report.find({score: 87})
// db.report.find({score: {$gt: 60}})

// 복합 필드 인덱스 생성
> db.report.createIndex({age:1, score: -1})
// 이렇게 여러 필드를 넣어 인덱스를 생성하면 age를 오름차순으로 정렬한 상태에서 score는 내림찬순으로 정렬합니다.
~~~

## 인덱스 속성
- 인덱스에 속성을 추가 할 땐 creatIndex() 메소드의 두번째 인자에 속성값을 document 타입으로 전달해주면 됩니다.
```> db.COLLECTION.createIndex({key: 1}, {PROPERTY: true})```

### Unique 속성
_id 필드처럼 컬렉션에 단 한개의 값만 존재 할 수 있는 속성입니다.
~~~
// email 인덱스에 unique 속성 적요
> db.userinfo.createIndex({email: 1}, {unique: true})

// unique 속성은 다음 처럼 복합 인덱스에도 적용 할 수 있습니다.
// firstName과 lastName 복합 인덱스에 unique 속성 적용
> db.userinfo.createIndex({firstName: 1, lastName: 1}, {unique: true})
~~~

### Partial(부분적) 속성
- partial속성은 document의 조건을 정하여 일부 document에만 인덱스를 적용 할 때 사용됩니다.
partial속성을 사용하면, 필요한 부분에만 인덱싱을 사용하여 저장공간도 아끼고 속도를 더 높일 수 있습니다.
~~~
// visitors 값이 1000보다 높은 document에만 name 필드에 인덱스 적용
> db.store.createIndex(
    {name: 1},
    {partialFilterExpression: {visitors: {&gt: 1000}}}
)
~~~

### TLL 속성
- 이 인덱스 속성은 Date 타입, 혹은 Date 배열 타입의 필드에 적용 할 수 있는 속성입니다.
이 속성을 사용하여 document를 expire(만료)시킬 수 있습니다.
즉, 추가하고 특정 시간이 지나면 document를 컬렉션에서 제거합니다.
~~~
// notifiedDate가 현재 시간과 1시간 이상 차이나면 제거
> db.notifications.createIndex({"notifiedDate": 1}, {expireAfterSeconds: 3600})
~~~
- document가 만료되어 제거 될 때, 시간이 아주 정확하지는 않습니다. 만료 되는 document를 제거하는 thread는 매 60초 마다 실행 됩니다.

## 인덱스 조회 및 제거
- 생성된 인덱스를 조회 할 땐 getIndexs()메서드를 사용합니다.
```db.COLLECTION.getIndexs()```

- 인덱스를 제거 할 땐 dropIndex()메서드를 사용합니다.
```db.COLLECTION.dropIndex({KEY: 1})```