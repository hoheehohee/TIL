# Setting up a large scale React application
## 대규모 React 애플리케이션 설정
- Karify(케어러파이)는 정신 건강 분야에서 소프트웨어를 만드는 네덜란드의 작은 회사에서 경험한 사례입니다.
- Karify는 약 75000 명의 사용자와 함께 7년 동안 비교적 큰 웹 애플리케이션을 실행하고 있습니다.
- 해당 Application에서는 메시징, 미디어 라이브러리, 사용자 관리, 할당 (예 : mood(기분, 감정) 차트 또는 명상 과제)과 같은 기능이 포함되어 있습니다.

요즘에는 작은 React 애플리케이션을 설정하거나 처음부터 시작하는 것이 매우 쉽습니다. 특히 create-react-app을 사용하는 경우.  
대부분의 프로젝트에는 몇 가지 dependencies(종속성)만 필요합니다 (예 : 상태관리 및 internationalization(국제화?))과 최소한 하나의 components 폴더가 있는 src 폴더만 필요합니다. 이것이 대부분의 React 프로젝트가 시작되는 방법이라고 생각합니다.  
그러나 일반적으로 프로젝트가 dependencies의 수를 늘리면 components, reducers 및 기타 공유 유틸리티가 때때로 제어되지 않는 방식으로 증가하는 경향이 있습니다.

- 일부 dependencies가 필요한 이유 또는 함께 작동하는 방법이 더 이상 명확하지 않은 경우 어떻게합니까?
- 또는 component가 너무 많으면 필요한 component를 찾기가 어려워 집니까?
- component를 찾고 싶지만 이름이 기억 나지 않을 때 어떻게합니까?

다음은 Karify에서 front-end를 재구축하는 동안 발생한 질문의 몇 가지 예입니다.  
우리는 dependencies와 component의 수가 결국 감당할 수 없을 정도로 증가하 것이라는 것을 알고 있었습니다. 즉, 향후 개발을 따라갈 수 있을 만큼 확장 가능한 계획이 필요했습니다.  
이 계획에는 파일 및 폴더 구조, 코드 품질에 대한 규칙 정의와 전체 아키텍처 정의가 포함되었습니다.  
가장 중요한 것은 이 모든 것이 새로운 개발자들이 우리의 모든 의존성과 코드 스타일에 대한 많은 통찰력을 요구하지 않고 쉽게 이해할 수 있어야 한다는 것이다.

작성하는 현재 약 1200개의 JavaScript 파일이 있으며 이 중 350 개는 단위 테스트 커버리지를 가지며 80%를 차지하는 components입니다.  
우리는 우리가 만든 architecture 과 conventions을 여전히 믿고 있기 때문에 그것들을 공유하는 것이 좋은 생각이라고 생각했습니다.  
다음 섹션에서는 프로젝트를 설정하는 방법과 우리가 배운 몇 가지 교훈을 살펴 보겠습니다.

## 파일 및 폴더를 구성하는 방법은 무엇입니까?
React frontend를 어떻게 구성하고 싶은지 알 때까지 여러 단계를 거쳤습니다.  
처음에는 jQuery 프런트 엔드와 동일한 저장소에 배치 할 생각이었습니다. 그러나 백엔드 프레임 워크에 도입된 폴더 구조로 인해 이 옵션이 바람직하지 않습니다. 다음으로, 우리는 그것을 별도의 저장소로 옮기는 것을 생각했습니다.   
처음에는 잘 작동했지만 시간이 지남에 따라 React Native 프런트 엔드와 같은 다른 프런트 엔드를 만드는 것에 대해 생각하기 시작했습니다. 이로 인해 컴포넌트 라이브러리가 필요했습니다. 우리는 이 새로운 저장소를 두 개의 별도 저장소로 분할했습니다. 하나는 컴포넌트 라이브러리 용이고 다른 하나는 새로운 React 프런트 엔드 용입니다.  
이것은 좋은 생각처럼 보였지만 매우 복잡한 검토 프로세스를 가져 왔습니다. 두 저장소의 변경 사항 간의 관계가 명확하지 않았습니다. 마지막으로 우리는 그것들을 다시 하나의 저장소로 모으기로 결정했지만 이번에는 monorepo로 선택했습니다.

우리는 컴포넌트 라이브러리와 프론트 엔드 애플리케이션 사이에 분리를 만들고 싶었 기 때문에 monorepo를 선택했습니다.  
우리의 monorepo와 다른 것들의 차이점은 우리가 그 안에 package를 게시할 필요가 없다는 것입니다. 우리에게 package는 모듈화 및 우려사항 분리를위한 수단으로 만 사용됩니다.  
각 애플리케이션에 대해 서로 다른 dependencies과 script를 지정할 수 있으므로 애플리케이션마다 서로 다른 패키지를 사용하는 것이 특히 유용합니다.

root package.json에서 다음 구성으로 yarn workspaces을 사용하여 monorepo를 설정했습니다.

```
"workspaces": [
  "app/*",
  "lib/*",
  "tool/*"
]
```

이제 여러분 중 일부는 왜 우리가 다른 monorepos에서 처럼 단순히 패키지 폴더를 사용하지 않았는지 궁금할 것입니다.  
주로 우리는 applications과 component libray를 분리하고 싶었기 때문입니다. 그 외에도 우리는 우리 자신의 도구를 만들어야한다는 것도 알고있었습니다.  
그래서 우리는 위에 보이는 폴더를 생각 해냈고 여기에 각각에 대한 설명이 있습니다.

- app: 이 폴더의 모든 패키지는 Karify 프론트 엔드, internal(내부) 프론트 엔드 및 스토리북(Storybook)과 같은 프론트 엔드 애플리케이션을 참조합니다.
- lib: 이 폴더의 모든 패키지는 공유 유틸리티를 프런트 엔드 애플리케이션에 노출하며 가능한 한 애플리케이션에 구애받지 않습니다. 이 패키지는 기본적으로 컴포넌트 라이브러리를 구성합니다. (예를 들면 typography, media 및 primitive package가 될 것입니다.)
- tool: 이 폴더에있는 모든 패키지는 Node.js 전용이며 우리가 직접 만든 tool 또는 우리가 의존하는 tool에 대한 구성 및 유틸리티일 수 있다. 몇 가지 예는 웹팩 유틸리티, linter 구성 및 파일 시스템 linter입니다.

어디에 배치하든 모든 패키지에는 항상 src 폴더가 있고 선택적으로 bin 폴더가 있습니다. 앱 및 lib 패키지의 src 폴더에는 다음 폴더 중 일부가 포함될 수 있습니다.

- actions: redux 또는 useReducer에서 dispatch함수로 전달할 수 있는 ation creator함수를 포함합니다.
- components: 각각의 definition(정의), translations(번역), 단위 테스트, 스냅샷 및 stories (해당되는 경우)가 있는 component 폴더를 포함합니다.
- constants: 다른 환경과 다른 유틸리티에서 재사용되는 변함없는 값을 보유합니다.
- fetch: API에서 payload에 대한 유형 정의 및 해당 payload 검색을 위한 각 비동기식 작업을 보유한다.
- helpers: 다른 categorie에 해당하지 않는 유틸리티를 보유합니다.
- reducers: redux 저장소 또는 useReducer에서 사용할 reducers를 포함합니다.
- routers: react-router 컴포넌트 또는 history기능에 사용될 router정의를 보유합니다
- selectors: redux state 또는 API payload에서 데이터를 읽거나 변환하는 helper함수를 포함합니다.

이 폴더 구조를 사용하면 dependencies에 의해 정의된 서로 다른 개념 간의 우려 사항을 명확하게 구분하므로 모듈식 코드를 작성할 수 있습니다. 이는 우리가 존재 여부를 아는 것과 관계없이 리포지토리에 variables, functions 또는 components의 존재 여부 파악하는데 도움이됩니다. 또한 이러한 폴더의 구조를 최소한으로 유지하는데 도움이되므로 처리가 더 쉬워집니다.

이 새로운 폴더 구조의 한 가지 과제는 우리가 그것을 고수하는지 확인하는 것입니다.  
서로 다른 패키지에 서로 다른 폴더를 만들고 파일을 서로 다르게 구성하고 싶을 것입니다. 이것이 항상 나쁜 생각은 아니지만 일관되게하지 않으면 엉망이 될 것입니다. 이를 돕기 위해 다음 섹션에서 자세히 설명 할 file system linter를 만들었습니다.

## How to enforce a style guide?

일관된 파일 및 폴더 구조를 원했던 것과 마찬가지로 코드에서 가능한 한 일관성을 유지하기를 원했습니다.  이것은 우리가 이미 jQuery 프론트 엔드에서 꽤 잘 해낸 일이지만 특히 CSS에 관해서는 개선 될 수 있습니다.  
따라서 처음부터 스타일 가이드를 정의하고 linter로 적용하려고했습니다. linter로 지정할 수 없는 규칙은 코드 검토 중에 적용됩니다.

monorepo에서 linter를 설정하는 것은 다른 저장소에서와 동일합니다. 한 번 실행하여 전체 저장소의 유효성을 검사 할 수 있기 때문에 좋습니다.  
linter에 익숙하지 않다면 우리가 사용하는 ESLint와 Stylelint를 살펴 보는 것이 좋습니다.

JavaScript linter가 있다는 것은 다음과 같은 사용 사례에 특히 유용합니다.

- HTML 대응 요소에 대한 접근성 component사용 적용: 디자인 과정에서 anchors, buttons, images 및 icon에 대한 몇가지 접근성 지침을 정의했습니다. 그런 다음 코드에서 이러한 지침을 구현하고 앞으로도 이를 잊지 않도록하기를 원했습니다. [eslint-plugin-react](https://github.com/yannickcr/eslint-plugin-react)의 [react/forbid-elements](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/forbid-elements.md) 규칙으로이 작업을 수행했습니다. 어떻게 생겼는지의 예:

```
'react/forbid-elements': [
    'error',
    {
        forbid: [
            {
                element: 'img',
                message: 'Use "<Image>" instead. This is important for accessibility reasons.',
            },
        ],
    },
],
```

- 라이브러리 패키지 내부에서 애플리케이션 패키지 import 금지 및 다른 애플리케이션 내부에서 애플리케이션 패키지 import 금지: 주로 monorepo에서 패키지 간의 순환 종속성을 피하고 우리가 만든 관심 사항의 분리에 충실하도록합니다. [eslint-plugin-import](https://github.com/benmosher/eslint-plugin-import)의 [import/no-restricted-paths](https://github.com/benmosher/eslint-plugin-import/blob/master/docs/rules/no-restricted-paths.md) 규칙으로이를 금지합니다.

JavaScript 및 CSS linting 외에도 자체 파일 시스템 linter가 있습니다. 이것이 우리가 폴더 구조를 고수하는 방법입니다.  
이 linter는 우리 것이므로 구조를 변경하기로 결정하면 언제든지 변경할 수 있습니다. 다음은 우리가 가지고있는 규칙의 몇 가지 예입니다.

- component 폴더의 구조를 확인: 항상 폴더와 이름이 같은 index.ts 및 .tsx 파일이 있는지 확인합니다.
- package.json 파일 유효성 검사: 우발적으로 패키지를 게시하지 않도록 항상 패키지 당 하나가 있고 비공개로 설정되어 있는지 확인하십시오.