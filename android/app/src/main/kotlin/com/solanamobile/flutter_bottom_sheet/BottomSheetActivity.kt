package com.solanamobile.flutter_bottom_sheet

import android.os.Bundle
import android.view.Gravity
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode

class BottomSheetActivity: FlutterActivity() {
    override fun getDartEntrypointFunctionName(): String {
        return "bottomsheet"
    }

    override fun getBackgroundMode(): BackgroundMode {
        return BackgroundMode.transparent
    }
}
