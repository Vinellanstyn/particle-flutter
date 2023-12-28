package com.particleauthcore.module

import androidx.annotation.Keep
import com.google.gson.annotations.SerializedName

@Keep
class ChainData {
    @SerializedName("chain_id")
    var chainId: Long = 0
}
