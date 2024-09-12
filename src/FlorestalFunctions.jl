module FlorestalFunctions

    # Inclui os módulos auxiliares no projeto
    include(joinpath(@__DIR__, "Functions.jl"))

    # Importa os pacotes utilizados para desenvolvimento e funcionamento do programa
    import CSV
    import DataFrames
    import Distribuitions
    import LinearAlgebra
    import Plots
    import QML
    import Statistics
    import XLSX

    #Exporta para o JULIA a função RunApp
    export RunApp

    # Ativa o programa em QML
    function RunApp()

        # Exporta as funções definidas em Julia para o arquivo .QML
        @qmlfunction Functions.descriptivestatistics Functions.regressoes Functions.graficos Functions. 

        # Atribui o diretório atual dos arquivos a uma variável
        current_directory = dirname(@__FILE__)

        # Carrega o arquivo .qml localizado no diretório atual
        loadqml(joinpath(current_directory, "src/qml", "main.qml"))

        # Executa o arquivo .QML localizado e carregado anteriormente
        exec()
    end
end
