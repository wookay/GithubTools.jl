module APIv4 # GithubTools

using HTTP
using JSON2

const GITHUB_GRAPHQL_SERVER = HTTP.URI("https://api.github.com/")
const USER_AGENT = "GithubTools.jl APIv4"

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}, body::IOBuffer)
    url = string(merge(endpoint, path=path))
    HTTP.post(url, headers; body=body)
end

function get_repo_stargazers(token::String,
                             owner::String,
                             name::String ;
                             endpoint::HTTP.URI = GITHUB_GRAPHQL_SERVER,
                             action::Function = http_action)
    body = JSON2.write((query="""query { repository(owner: "$owner", name: "$name") { stargazers { totalCount } } }""",))
    headers = ["Authorization" => "bearer $token", "User-Agent" => USER_AGENT, "Content-Type" => "application/json"]
    resp = action(endpoint, "/graphql", headers, IOBuffer(body))
    data = JSON2.read(IOBuffer(resp.body))
end

end # module GithubTools.APIv4
