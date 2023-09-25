// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Window 2.15
import UavConfigurator 1.0

Window {
    width: Constants.width
    height: Constants.height
    color: Constants.veryLightBlue

    visible: true
    title: "UavConfigurator"

    MainView {
        id: mainScreen
    }

}

