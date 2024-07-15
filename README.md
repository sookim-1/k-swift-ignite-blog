# blog-website
![create_post](https://github.com/sookim-1/blog-website/actions/workflows/create_post.yml/badge.svg)
![build-and-deploy](https://github.com/sookim-1/blog-website/actions/workflows/build-and-deploy.yml/badge.svg)

## 저장소 설명
[sookim-1 주간회고록](https://sookim-1.github.io/) : 매주 개발과 관련된 회고록 작성한 블로그


## 블로그 배포방법
1. [Content/posts](./Content/posts) 폴더에 마크다운문서를 추가합니다.
2. 추가한 후 main브랜치에 Merge되면 [build-and-deploy.yml](./.github/workflows/build-and-deploy.yml) 워크플로가 동작합니다.
3. 워크플로가 통과되면 [sookim-1.github.io](https://github.com/sookim-1/sookim-1.github.io) 원격저장소에 배포됩니다.

## 문서 작성방법
1. [create_post.yml](./.github/workflows/create_post.yml) 워크플로를 동작합니다.
2. 문서번호, 작성일자, 회고 시작일, 회고 종료일을 입력받아서 문서를 작성하여 PR이 진행됩니다.
3. 문서내용을 수정하여 PR을 Merge하면 위의 블로그 배포방법 순서로 배포됩니다.
