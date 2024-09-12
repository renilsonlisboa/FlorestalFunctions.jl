module FlorestalFunctions

    # Importa os pacotes utilizados para desenvolvimento e funcionamento do programa
    import QML: QString, @qmlfunction, loadqml, exec
    using LinearAlgebra
    using Statistics
    import Plots: scatter, plot!, savefig

    export RunApp

    # Ativa o programa em QML
    function RunApp()
        # Exporta as funções definidas em Julia para o arquivo .QML
        @qmlfunction ajustarEq

        # Atribui o diretório atual dos arquivos a uma variável
        current_directory = dirname(@__FILE__)

        # Carrega o arquivo .qml localizado no diretório atual
        loadqml(joinpath(current_directory, "qml", "main.qml"))

        # Executa o arquivo .QML localizado e carregado anteriormente
        exec()
    end
end
