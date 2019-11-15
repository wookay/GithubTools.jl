using GithubTools.APIv4
using Dates

token = get(ENV, "GITHUB_TOKEN", "")
owner = "JuliaLang"
name = "julia"
repo = APIv4.get_repo_stargazers(token, owner, name)
println(now(), " ", "$owner/$name", " ", repo.data.repository.stargazers.totalCount)
