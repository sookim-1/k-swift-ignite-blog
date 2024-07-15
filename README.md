# blog-website
![create_post](https://github.com/sookim-1/blog-website/actions/workflows/create_post.yml/badge.svg)
![build-and-deploy](https://github.com/sookim-1/blog-website/actions/workflows/build-and-deploy.yml/badge.svg)

## 저장소 설명
[sookim-1 주간회고록](https://sookim-1.github.io/) : 매주 개발과 관련된 회고록 작성한 블로그


## 수동 배포방법
1. [Content/posts](./Content/posts) 폴더에 마크다운문서를 추가합니다.
2. 추가한 후 main브랜치에 Merge되면 [ci.yml](./.github/workflows/) 워크플로가 동작합니다.
3. [deploy.yml](./.github/workflows/) 워크플로를 실행하면 [sookim-1.github.io](https://github.com/sookim-1/sookim-1.github.io) 원격저장소에 배포됩니다.

## 자동 배포방법
1. [create_post.yml](./.github/workflows/) 워크플로를 동작합니다.
2. 추가된 브랜치와 마크다운 문서를 수정한 후 PR을 main브랜치에 Merge되면 [ci.yml](./.github/workflows/) 워크플로가 동작합니다.
3. 성공하면 [deploy.yml](./.github/workflows/) 워크플로를 실행된 후 [sookim-1.github.io](https://github.com/sookim-1/sookim-1.github.io) 원격저장소에 배포됩니다.

### TroubleShooting
1. 일부 iOS 이모지가 배포가 안되는 이슈가 있습니다.
