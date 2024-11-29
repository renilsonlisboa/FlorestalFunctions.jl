

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 6.5
import QtQuick.Dialogs 6.5
import org.julialang

ApplicationWindow {
    id: baseAlign
    width: 640
    height: 720
    color: Constants.backgroundColor
    visible: true

    //title: "Florestal Functions"
    GridLayout {
        id: grid
        anchors.centerIn: parent
        width: 400
        height: 400
        columns: 1
        columnSpacing: 25
        rowSpacing: 25

        Button {
            id: selectecDescriptiveStatistics
            text: qsTr("Estatística Descritiva")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: selectecDescriptiveStatistics.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter

                font.pointSize: 14
                font.family: "Arial"
            }

            Connections {
                target: selectecDescriptiveStatistics
                onClicked: {
                    descriptiveStatistics.visible = true
                }
                onClosing: {
                    descriptiveStatistics.visible = false
                }
            }
        }
        Button {
            id: hipotesisTest
            text: qsTr("Testes de Hipóteses")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: hipotesisTest.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
                font.family: "Arial"
            }

            Connections {
                target: hipotesisTest
                onClicked: {
                    hipotesisTestWindow.visible = true
                }
                onClosing: {
                    hipotesisTestWindow.visible = false
                }
            }
        }
        Button {
            id: delineamentosExperimentais
            text: qsTr("Delineamentos Experimentais")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: delineamentosExperimentais.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
                font.family: "Arial"
            }

            Connections {
                target: delineamentosExperimentais
                onClicked: {
                    delineamentoWindow.visible = true
                }
                onClosing: {
                    delineamentoWindow.visible = false
                }
            }
        }
        Button {
            id: regressions
            text: qsTr("Regressões")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: regressions.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 14
                font.family: "Arial"
            }

            Connections {
                target: regressions
                onClicked: {
                    regressionsWindow.visible = true
                }
                onClosing: {
                    regressionsWindow.visible = false
                }
            }
        }
    }
    Window {
        id: descriptiveStatistics
        width: 640
        height: 480
        title: "Estatística Descritiva"
        visible: false

        // Conteúdo da nova janela
        Rectangle {
            color: black
            width: parent.width
            height: parent.height

            Button {
                id: importDataDescriptive
                text: qsTr("Importar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -185

                Connections {
                    target: importDataDescriptive
                    onClicked: {
                        importData.open()
                    }
                }
            }
            Grid {
                id: gridLayoutDescriptiveCheckBox
                columns: 2
                anchors.centerIn: parent
                spacing: 10

                CheckBox {
                    id: media
                    text: qsTr("Média")
                }
                CheckBox {
                    id: moda
                    text: qsTr("Moda")
                }
                CheckBox {
                    id: mediana
                    text: qsTr("Mediana")
                }
                CheckBox {
                    id: pm
                    text: qsTr("Ponto Médio")
                }
                CheckBox {
                    id: ampTotal
                    text: qsTr("Amplitude Total")
                }
                CheckBox {
                    id: variancia
                    text: qsTr("Variância")
                }
                CheckBox {
                    id: desvPad
                    text: qsTr("Desvio Padrão")
                }
                CheckBox {
                    id: cv
                    text: qsTr("Coeficiente de Variação")
                }
                CheckBox {
                    id: erroPadMedia
                    text: qsTr("Erro Padrão da Média")
                }
                CheckBox {
                    id: min
                    text: qsTr("Valor Minímo")
                }
                CheckBox {
                    id: max
                    text: qsTr("Valor Maxímo")
                }
                CheckBox {
                    id: nAmostras
                    text: qsTr("Nº de Dados")
                }
            }

            Button {
                id: processDataDescriptive
                text: qsTr("Processar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 185

                Connections {
                    target: processDataDescriptive
                    onClicked: {
                        conclusionDialog.open()
                    }
                }
            }
        }

        FileDialog {
            id: importData
            title: "Selecione o arquivo .CSV com os dados"
            fileMode: FileDialog.OpenFile
            nameFilters: ["CSV Files (*.csv)"]
            Component.onCompleted: visible = false

            Connections {
                target: importData
                onAccepted: {

                }
            }
        }

        MessageDialog {
            id: conclusionDialog
            title: "Dados Processados com Sucesso"
            text: "Seus resultados são bons"
        }
        MessageDialog {
            id: errorImportDialog
            title: "Arquivo Importado com Sucesso"
            text: "O arquivo selecionado foi importado com sucesso"
        }
        MessageDialog {
            id: sucessImportDialog
            title: "Falha ao Importar Arquivo"
            text: ""
        }

        FileDialog {
            id: saveFileDialog
            title: "Selecione o local para salvar o arquivo..."
            fileMode: FileDialog.SaveFile
            Connections {
                target: saveFileDialog
                onAccepted: {
                    Julia.saveFile(resultVals, saveFileDialog.selectedFile)
                    conclusionDialog.open()
                }
            }
        }
    }

    Window {
        id: hipotesisTestWindow
        width: 640
        height: 480
        title: "Teste de Hipoteses"
        visible: false

        // Conteúdo da nova janela
        Rectangle {
            color: black
            width: parent.width
            height: parent.height

            Button {
                id: importDataHipotesis
                text: qsTr("Importar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -185

                Connections {
                    target: importDataHipotesis
                    onClicked: {
                        importData.open()
                    }
                }
            }
        }
    }

    Window {
        id: delineamentoWindow
        width: 640
        height: 480
        title: "Delineamentos Experimentais"
        visible: false

        // Conteúdo da nova janela
        Rectangle {
            color: black
            width: parent.width
            height: parent.height

            Button {
                id: importDataDelineamento
                text: qsTr("Importar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -185

                Connections {
                    target: importDataDelineamento
                    onClicked: {
                        importData.open()
                    }
                }
            }
        }
    }

    Window {
        id: regressionsWindow
        width: 640
        height: 480
        title: "Delineamentos Experimentais"
        visible: false

        // Conteúdo da nova janela
        Rectangle {
            color: black
            width: parent.width
            height: parent.height

            Button {
                id: importDataRegressions
                text: qsTr("Importar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -185

                Connections {
                    target: importDataRegressions
                    onClicked: {
                        importData.open()
                    }
                }
            }

            Button {
                id: processRegressions
                text: qsTr("Processar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 185

                Connections {
                    target: processRegressions
                    onClicked: {
                        conclusionDialog.open()
                    }
                }
            }

            ComboBox {
                id: comboBox
                anchors.centerIn: parent
                width: 500
                height: 30
                currentIndex: 0

                // Adicionar 10 opções ao ComboBox
                model: ListModel {
                    id: model
                    ListElement {
                        text: "Y = β0 + β1*d"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d²"
                    }
                    ListElement {
                        text: "Y = β0 + β1*(d²h)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*ln(d)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*ln(1/d)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*(1/d²)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d + β2*d²"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d² + β2*(d²h) + β3*h"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d + β2*d² + β3*(dh) + β4*(d²h)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d + β2*d² + β3*(dh²) + β4*(d²h)"
                    }
                    ListElement {
                        text: "Y = β0 + β1*d² + β2*(d²h) + β3*h² + β4*(dh²)"
                    }
                    ListElement {
                        text: "Y = β0 * dβ1"
                    }
                    ListElement {
                        text: "Y = β0 * (1/d)β1"
                    }
                    ListElement {
                        text: "Y = β0 * (d²h)β1"
                    }
                    ListElement {
                        text: "Y = β0 * (dh²)β1"
                    }
                    ListElement {
                        text: "Y = β0 * (d)β1 * (1/d)β2"
                    }
                    ListElement {
                        text: "Y = β0 * (d)β1 * (h)β2"
                    }
                }

                contentItem: Text {
                    text: comboBox.currentText
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 14
                    font.family: "Arial"
                }

                delegate: ItemDelegate {
                    width: comboBox.width
                    height: comboBox.height

                    contentItem: Text {
                        text: model.text
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 14
                        font.family: "Arial"
                        padding: 10
                    }
                }
            }
        }
    }
}