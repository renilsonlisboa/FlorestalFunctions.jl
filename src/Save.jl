module Save
        
    # Ativa os pacotes usados para a função saveFile funcionar
    import QML: QString
    import DataFrames: DataFrame, eachcol, names
    import CSV: CSV.read
    import XLSX: XLSX.writetable 

    # Exporta as funções definidas nesse módulo
    export saveFile

    # Define a função  saveFile usada para salvar o arquivo de resultado
    function saveFile(Dados, uri)

        # Converte a entrada em QString do QML em String do Julia
        uri_s = QString(uri)

        # Remover o prefixo "file:///"
        cleaned_path = replace(uri_s, "file:///" => "")

        # Remove o sufixo da URL (extensão caso selecionada)
        cleaned_path = split(cleaned_path, ".")[1]

        # Converte os resultados em DADOS e Resultados
        Dados = convert.(DataFrame, Dados)

        display(Dados)
    end
end