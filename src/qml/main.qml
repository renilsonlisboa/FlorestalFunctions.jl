

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

ApplicationWindow {
    id: baseAlign
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    GridLayout {
        id: grid
        anchors.centerIn: parent
        width: 400
        height: 400
        columns: 2
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
            }

            Connections {
                target: selectecDescriptiveStatistics
                onClicked: {
                    descriptiveStatistics.visible = true
                    baseAlign.visible = false
                }
                onClosing: {
                    descriptiveStatistics.visible = false
                    baseAlign.visible = true
                }
            }
        }
        Button {
            id: hipotesisTest
            text: qsTr("Testes de Hipoteses")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: hipotesisTest.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Connections {
                target: hipotesisTest
                onClicked: {
                    descriptiveStatistics.visible = true
                    baseAlign.visible = false
                }
                onClosing: {
                    descriptiveStatistics.visible = false
                    baseAlign.visible = true
                }
            }
        }
        Button {
            id: delineamentosExperimentais
            text: qsTr("Delineamentos")
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentItem: Text {
                text: delineamentosExperimentais.text
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            Connections {
                target: delineamentosExperimentais
                onClicked: {
                    descriptiveStatistics.visible = true
                    baseAlign.visible = false
                }
                onClosing: {
                    descriptiveStatistics.visible = false
                    baseAlign.visible = true
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
            }

            Connections {
                target: regressions
                onClicked: {
                    descriptiveStatistics.visible = true
                    baseAlign.visible = false
                }
                onClosing: {
                    descriptiveStatistics.visible = false
                    baseAlign.visible = true
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
                anchors.verticalCenterOffset: -100

                Connections {
                    target: importDataDescriptive
                    onClicked: {
                        importData.open()
                    }
                }
            }
            Grid {
                id: gridLayoutDescriptiveCheckBox
                columns: 6
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
                    id: pltDispersão
                    text: qsTr("Erro Padrão da Média")
                }
                CheckBox {
                    id: pltHistogram
                    text: qsTr("Erro Padrão da Média")
                }
                CheckBox {
                    id: erroPadMedia2
                    text: qsTr("Erro Padrão da Média")
                }
            }

            Button {
                id: processDataDescriptive
                text: qsTr("Processar Dados")
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 100

                Connections {
                    target: processDataDescriptive
                }
            }
        }

        FileDialog {
            id: importData
            title: "Selecione o arquivo .CSV com os dados"
            fileMode: FileDialog.SaveFile

            Connections {
                target: importData
                onAccepted: newWindow.title = "Funfo"
            }
        }
    }
}
