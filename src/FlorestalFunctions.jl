module FlorestalFunctions

    # Inclui os módulos auxiliares no projeto
    include(joinpath(@__DIR__, "Functions.jl"))
    include(joinpath(@__DIR__, "ImportData.jl")) # Função para importar dados .CSV
    include(joinpath(@__DIR__, "Save.jl"))

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

    # Função para seleção de arquivo em .CSV com dados para processamento
    function singleFile(arg)
        ImportData.singlefile(arg)
    end

    # Função salvar os resultados do processamento em .XLSX
    function saveFile(Resultado, uri)
        Save.saveFile(Resultado, uri)
    end

    function descriptiveStatistics(arg)
        Functions.descriptiveStatistics(arg)
    end

    # Ativa o programa em QML
    function RunApp()

        QML.@qmlfunction singleFile saveFile descriptiveStatistics

        # Atribui o diretório atual dos arquivos a uma variável
        current_directory = dirname(@__FILE__)

        # Carrega o arquivo .qml localizado no diretório atual
        QML.loadqml(joinpath(current_directory, "qml", "main.qml"))

        # Executa o arquivo .QML localizado e carregado anteriormente
        QML.exec()
    end
end
