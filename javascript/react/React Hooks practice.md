# React Hooks practice

## useState
- useState는 가장 기본적인 Hook이며, 함수형 컴포넌트에서도 가변적인 상태를 지닐 수 있게 해줍니다.

## useEffect
- useEffect는 리액트 컴포넌트가 렌더링될 때마다 특정 작업을 수행하도록 설정할 수 있는 Hook입니다.
- 클래스형 컴포넌트의 componentDidMount와 componentDidUpdate를 합친 형태로 보아도 무방합니다.

### 마운트될 때만 실행하고 싶을 때 (componentDidMount)
- useEffect에서 설정한 함수를 컴포넌트가 화면에 맨 처음 렌더링될 때만 실행하고, 업데이트될 때는 실행하지 않으려면 함수의 두번째 파라미터로 비어있는 배열을 넣어주면 됩니다.
~~~js
useEffect(() => {
    console.log('componentDidMount()')
}, [])
~~~

### 특정 값이 업데이트될 때만 실행하고 싶을 때 (componentDidUpdate)
- useEffect의 두 번째 파라미터로 전달되는 배열 안에 검사하고 싶은 값을 넣어주면 됩니다.
~~~js
// class component
componentDidUpdate(prevProps, prevState){
    if(prevProps.key !== this.props.key){
        console.log('componentDidUpdate()')
    }
}

// functional component
useEffect(() => {
    console.log('componentDidUpdate()')
}, ['key'])
~~~

### 뒷정리하기 (componentWillUnmount())
- useEffect는 기본적으로 렌더링되고 난 직후마다 실행되며, 두 번째 파라미터 배열에 무엇을 넣는지에 따라 실행되는 조건이 달라집니다.
- 컴포넌트가 언마운트되기 전이나 업데이트되기 직전에 어떠한 작업을 수행하고 싶다면 useEffect에서 뒷정리(cleanup) 함수를 반환해 주어야 합니다.
~~~js
useEffect(() => {
    console.log('useEffect()')

    return () => {
        console.log('componentWillUnmount()')
    }
}, ['key'])
~~~


> 아래 Hook은 차후 다시 확인하기!!!!!

## useReducer
- useReducer는 useState보다 더 다양한 컴포넌트 상화에 따라 다양한 상태를 다른 값으로 업데이트해 주고 싶을 때 사용하는 Hook입니다.

## useMemo
- useMemo를 사용하면 함수형 컴포넌트 내부에서 발생하는 연산을 최적화할 수 있습니다.

## useCallback
- useCallback은 useMemo와 비슷한 함수입니다. 주로 렌더링 성능을 최적화해야 하는 상황에서 사용하는데요. 이 Hook을 사용하면 만들어 놨던 함수를 재사용할 수 있습니다.

## useRef
- useRef Hook은 함수형 컴포넌트에서 ref를 쉽게 사용할 수 있도록 해 줍니다.

## 커스텀 Hooks만들기
- 여러 컴포넌트에서 비슷한 기능을 공유할 경우, 이를 여러분만의 Hook으로 작성하여 로직을 재사용할 수 있습니다.