//
//  HomeEntity.swift
//  TestSalinas
//
//  Created by Miguel Mexicano Herrera on 17/11/21.
//  Copyright © 2021 nut. All rights reserved.
//

import Foundation

struct DataHome {
    var description: String?
    var sizeCell: Double?

    func getData() -> [DataHome] {
        let data: [DataHome] = [
            DataHome(description: "Input", sizeCell: 60),
            DataHome(description: "Tomar Selfie", sizeCell: 70),
            DataHome(description: "Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental).", sizeCell: 400)
        ]
        return data
    }
}
