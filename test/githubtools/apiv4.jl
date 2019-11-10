module test_githubtools_apiv4

using Test
using GithubTools.APIv4
using Bukdu
using JSON2

struct RepoController <: ApplicationController
    conn::Conn
end

function get_repo_stargazers(::RepoController)
    render(JSON, (data=(repository=(stargazers=(totalCount=1,),),),))
end

routes() do
    post("/graphql", RepoController, get_repo_stargazers)
end

function mock_action(endpoint, path, headers, body::IOBuffer)
    Router.call(post, path, headers, read(body)).resp
end

token = ""
repo = APIv4.get_repo_stargazers(token, "wookay", "Jive.jl"; action=mock_action)
@test repo.data.repository.stargazers.totalCount == 1

end # module test_githubtools_apiv4
