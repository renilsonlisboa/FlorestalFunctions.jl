using FlorestalFunctions
using Documenter

DocMeta.setdocmeta!(FlorestalFunctions, :DocTestSetup, :(using FlorestalFunctions); recursive=true)

makedocs(;
    modules=[FlorestalFunctions],
    authors="renilsonlisboa <renilsonlisboajunior@gmail.com> and contributors",
    sitename="FlorestalFunctions.jl",
    format=Documenter.HTML(;
        canonical="https://renilsonlisboa.github.io/FlorestalFunctions.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/renilsonlisboa/FlorestalFunctions.jl",
    devbranch="master",
)
