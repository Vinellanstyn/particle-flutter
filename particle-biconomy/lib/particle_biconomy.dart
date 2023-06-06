import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:particle_auth/model/chain_info.dart';
import 'package:particle_biconomy/model/biconomy_version.dart';

class ParticleBiconomy {
  ParticleBiconomy._();

  static const MethodChannel _channel = MethodChannel('biconomy_bridge');

  /// Init particle-biconomy SDK
  ///
  /// [version] Biconomy version
  ///
  /// [dappKeys] Biconomy dapp keys
  static init(BiconomyVersion version, Map<int, String> dappKeys) {
    // Convert integer keys to strings
    var stringKeyMap =
        dappKeys.map((key, value) => MapEntry(key.toString(), value));

    if (Platform.isIOS) {
      _channel.invokeMethod(
          'initialize',
          jsonEncode({
            "version": version.name,
            "dapp_app_keys": stringKeyMap,
          }));
    } else {
      _channel.invokeMethod(
          'init',
          jsonEncode({
            "version": version.name,
            "dapp_app_keys": stringKeyMap,
          }));
    }
  }

  static Future<bool> isSupportChainInfo(ChainInfo chainInfo) async {
    return await _channel.invokeMethod(
        'isSupportChainInfo',
        jsonEncode({
          "chain_name": chainInfo.chainName,
          "chain_id_name": chainInfo.chainIdName,
          "chain_id": chainInfo.chainId,
        }));
  }

  static Future<String> isDeploy(String eoaAddress) async {
    return await _channel.invokeMethod('isDeploy', eoaAddress);
  }

  static Future<bool> isBiconomyModeEnable() async {
    return await _channel.invokeMethod("isBiconomyModeEnable");
  }

  static enableBiconomyMode() {
    _channel.invokeMethod("enableBiconomyMode");
  }

  static disableBiconomyMode() {
    _channel.invokeMethod("disableBiconomyMode");
  }

  static Future<dynamic> rpcGetFeeQuotes(
      String eoaAddress, List<String> transactions) async {
    return await _channel.invokeMethod("rpcGetFeeQuotes",
        jsonEncode({"eoa_address": eoaAddress, "transactions": transactions}));
  }
}