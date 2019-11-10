using GithubTools.APIv4

token = get(ENV, "GITHUB_TOKEN", "")
repo = APIv4.get_repo_stargazers(token, "JuliaLang", "julia")
@info repo
@info repo.data.repository.stargazers.totalCount
