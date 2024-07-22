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

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val windowLayoutParams = window.attributes
        windowLayoutParams.gravity = Gravity.BOTTOM
//        windowLayoutParams.flags =
//            windowLayoutParams.flags and WindowManager.LayoutParams.FLAG_DIM_BEHIND
        window.attributes = windowLayoutParams
//        window.setDecorFitsSystemWindows(false)
    }
}
