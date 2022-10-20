import 'package:flutter/foundation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:particle_connect/model/connect_info.dart';
import 'package:particle_wallet/model/language.dart';
import 'package:particle_wallet/model/user_interface_style.dart';
import 'package:particle_wallet/particle_wallet.dart';
import 'package:particle_connect/model/chain_info.dart';

class WalletLogic {
  static void init() {
    ParticleWallet.init();
  }

  static void navigatorWallet() {
    ParticleWallet.navigatorWallet(0);
  }

  static void navigatorTokenReceive() {
    ParticleWallet.navigatorTokenReceive(
        "8ci2fZwQSmArbeHkuA7M8h5rsRwwh4FMTXrZxb3KsDpb");
  }

  static void navigatorTokenSend() {
    ParticleWallet.navigatorTokenSend(
        "8ci2fZwQSmArbeHkuA7M8h5rsRwwh4FMTXrZxb3KsDpb",
        "1232fZwQSmArbeHkuA7M8h5rsRwwh4FMTXrZxb3KsDpb",
        1000000);
  }

  static void navigatorTokenTransactionRecords() {
    ParticleWallet.navigatorTokenTransactionRecords(
        "8ci2fZwQSmArbeHkuA7M8h5rsRwwh4FMTXrZxb3KsDpb");
  }

  static void navigatorNFTSend() {
    ParticleWallet.navigatorNFTSend(
        "0xD000F000Aa1F8accbd5815056Ea32A54777b2Fc4", "1412", "");
  }

  static void navigatorNFTDetails() {
    String mint = "0xD000F000Aa1F8accbd5815056Ea32A54777b2Fc4";
    String tokenId = "1412";
    ParticleWallet.navigatorNFTDetails(mint, tokenId);
  }

  static void enablePay() {
     bool enable = true;
    ParticleWallet.enablePay(enable);
  }

  static void getEnablePay() async {
    bool isEnable = await ParticleWallet.getEnablePay();
    showToast("isEnable:$isEnable");
  }

  static void enableSwap() {
    bool enable = true;
    ParticleWallet.enableSwap(enable);
  }

  static void getEnableSwap() async {
    bool isEnable = await ParticleWallet.getEnableSwap();
    showToast("isEnable:$isEnable");
  }

  static void navigatorPay() {
    ParticleWallet.navigatorPay();
  }

  static void navigatorSwap() {
    ParticleWallet.navigatorSwap();
  }

  static void navigatorLoginList() async {
    String result = await ParticleWallet.navigatorLoginList();
    print("result:$result");
    showToast("result: $result");
  }

  static void supportChain() {
    List<ChainInfo> chainInfos = <ChainInfo>[];
    chainInfos.add(EthereumChain.mainnet());
    chainInfos.add(PolygonChain.mainnet());
    chainInfos.add(BSCChain.mainnet());
    ParticleWallet.supportChain(chainInfos);
  }

  static void switchWallet() async {
    WalletType walletType = WalletType.particle;
    String publicAddress = "";
    bool result = await ParticleWallet.switchWallet(walletType, publicAddress);
    print("result:$result");
    showToast("result: $result");
  }

  static void showTestNetwork() {
    bool enable = false;
    ParticleWallet.showTestNetwork(enable);
  }

  static void showManageWallet() {
    bool enable = true;
    ParticleWallet.showManageWallet(enable);
  }
  
  static void setLanguage() {
    Language language = Language.system;
    ParticleWallet.setLanguage(language);
  }

  static void setInterfaceStyle() {
    UserInterfaceStyle interfaceStyle = UserInterfaceStyle.light;
    ParticleWallet.setInterfaceStyle(interfaceStyle);
  }
}