# GithubTools.jl

|  **Build Status**                                                |
|:----------------------------------------------------------------:|
|  [![][travis-img]][travis-url]  [![][codecov-img]][codecov-url]  |


https://developer.github.com/v4/

```julia
using GithubTools.APIv4

token = get(ENV, "GITHUB_TOKEN", "")
owner = "JuliaLang"
name = "julia"
repo = APIv4.get_repo_stargazers(token, owner, name)
println(now(), " ", "$owner/$name", " ", repo.data.repository.stargazers.totalCount)
```


[travis-img]: https://api.travis-ci.org/wookay/GithubTools.jl.svg?branch=master
[travis-url]: https://travis-ci.org/wookay/GithubTools.jl

[codecov-img]: https://codecov.io/gh/wookay/GithubTools.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/GithubTools.jl/branch/master
