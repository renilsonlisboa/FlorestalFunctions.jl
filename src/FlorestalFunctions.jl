module FlorestalFunctions

    # Inclui os módulos auxiliares no projeto
    include(joinpath(@__DIR__, "src/Functions.jl"))

    # Importa os pacotes utilizados para desenvolvimento e funcionamento do programa
    import CSV
    import DataFrames
    import LinearAlgebra
    import Plots
    import QML
    import Statistics
    import XLSX

    #Exporta para o JULIA a função RunApp
    export RunApp

    # Ativa o programa em QML
    function RunApp()

        # Atribui o diretório atual dos arquivos a uma variável
        current_directory = dirname(@__FILE__)

        # Carrega o arquivo .qml localizado no diretório atual
        QML.loadqml(joinpath(current_directory, "src/qml", "main.qml"))

        # Executa o arquivo .QML localizado e carregado anteriormente
        QML.exec()
    end
end
