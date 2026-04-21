// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
                .target(name: "Libstarmine_ad", condition: .when(platforms: [.macOS, .iOS])),
            ],
            path: "Sources/_MPVKit",
            exclude: ["dummy.c", "include"],
            sources: ["Exports.swift"],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
                .target(name: "Libstarmine_ad", condition: .when(platforms: [.macOS, .iOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        .binaryTarget(
            name: "Libmpv-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libmpv-GPL.xcframework.zip",
            checksum: "1370358e84e466f920319f35ae191012bdde367d1f7f0958a3d61b2c9b5fc439"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavcodec-GPL.xcframework.zip",
            checksum: "3ddc434e34b728063c206fe99ade8eabc5276d423f97b3f854357669e092e328"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavdevice-GPL.xcframework.zip",
            checksum: "c3741db8032d3e041c6d6376efdae0dfc5830fef55298cbeeb9a809e4e7a6585"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavformat-GPL.xcframework.zip",
            checksum: "f956a17bb88de4bb55cb79eeaf3b8317e095e57af2ae0cb41408de1bc80d8d61"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavfilter-GPL.xcframework.zip",
            checksum: "bccf0a6fe5c752211218b3e8260dc3a4a660643c6f710d954ea2daa0a24d60e4"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavutil-GPL.xcframework.zip",
            checksum: "5cd70b6a2bdd36bfec62d4d295addccb438b728f52b52b1762bce5961507c875"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libswresample-GPL.xcframework.zip",
            checksum: "0128d663092d7831b961efccd908ccb0df4ab5c89e1e7501a1dc4d9a2dbf2dd8"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libswscale-GPL.xcframework.zip",
            checksum: "21b58314acb391d9346a003d9dd42e45485e30c596154d97542336f8c6fedffa"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "593283be2a90f7fd66f6e6ed331b2f099cf403e0926fe3b4ac09a7062b793965"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "ff5ffd43d015d7285fd37e4a3145b25cbd8d2842740bd629a711c299a20e226a"
        ),

        .binaryTarget(
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip",
            checksum: "ad33c7a08f4cdcb9924c8f0e6d9a054dad33d7794b97667bf8b6fb2b236ae585"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip",
            checksum: "0fdf3ebf8bd7b8bc8eee837cf27261cb4c52ae520b6576a2f468656aa1691e02"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip",
            checksum: "25727c9fa67287fa0a4f4722f88bb8be669b23cd7e837e2d00870eb8a25d3f27"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip",
            checksum: "3dbec5809339189bf9679e218c6cff387ebf8fb72745927835afc2678f5c9f4d"
        ),

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libunibreak.xcframework.zip",
            checksum: "001087c0e927ae00f604422b539898b81eb77230ea7700597b70393cd51e946c"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libfreetype.xcframework.zip",
            checksum: "f2840aba1ce35e51c0595557eee82c908dac8e32108ecc0661301c06061e051c"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libfribidi.xcframework.zip",
            checksum: "4a55513792ef7a17893875f74cc84c56f3657e8768c07a7a96f563a11dc4b743"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libharfbuzz.xcframework.zip",
            checksum: "91558d8497d9d97bc11eeef8b744d104315893bfee8f17483d8002e14565f84b"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libass.xcframework.zip",
            checksum: "1e41f5a69c74f6c6407aab84a65ccd0b34e73fa44465f488f99bf22bd61b070d"
        ),

        .binaryTarget(
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13-2512/Libsmbclient.xcframework.zip",
            checksum: "3a53375fab11bc888cc553664ea5dd902208d04f0cc21ec746302bf356246b6f"
        ),

        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip",
            checksum: "bc037d34e2b0b5ab7f202fb371f5fb298136cc66fdf406c2172185d06f53f18d"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-xcode/Libuavs3d.xcframework.zip",
            checksum: "1e69250279be9334cd2f6849abdc884c8e4bb29212467b6f071fdc1ac2010b6b"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/mpvkit/moltenvk-build/releases/download/1.4.1/MoltenVK.xcframework.zip",
            checksum: "9bd1ca1e4563bacd25d6e55d37b10341d50b2601bc2684bc332188e79daa2b79"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.351.0-2512/Libplacebo.xcframework.zip",
            checksum: "3b2bd57b82549566963effadf0891a141448d9f89c7d48fca0b8f823b854bac6"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.2-xcode/Libdav1d.xcframework.zip",
            checksum: "8a8b78e23e28ecc213232805f3c1936141fc9befe113e87234f4f897f430a532"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavcodec.xcframework.zip",
            checksum: "190e5a94e6b992ba8690a07475099092b2a9cba50eed6dc8115ca61cfee7e7ea"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavdevice.xcframework.zip",
            checksum: "87f3891aee5d3ce0fd05a97d5dc21bae61c5cf190ed3c0f3e048e3272a722dab"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavformat.xcframework.zip",
            checksum: "e003a298c48cef6c4a6bc8e4a59cff4c03a333ef6ed02fb865e3e6fa542477ab"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavfilter.xcframework.zip",
            checksum: "b50614e183783cb96e49bf7ae02d730fef64a1b85d4d8ec37927f8b1e6198967"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libavutil.xcframework.zip",
            checksum: "b7f4b85254d59e6e26f2f15834e12ef6eeb4f04a741649293700e371e9d3717e"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libswresample.xcframework.zip",
            checksum: "012ece4423d6c354943fa8823af10fe57671842d0a38407896144b7b350a080b"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libswscale.xcframework.zip",
            checksum: "4db384b60fbf50f7a2e50a260635e76fa8cd04728cd9af0627b2636f1e9aff9a"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8-xcode/Libuchardet.xcframework.zip",
            checksum: "503202caa0dafb6996b2443f53408a713b49f6c2d4a26d7856fd6143513a50d7"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-xcode/Libluajit.xcframework.zip",
            checksum: "8e76f267ee100ff5f3bbde7641b2240566df722241cdf8e135be7ef3d29e237a"
        ),

        .binaryTarget(
            name: "Libstarmine_ad",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libstarmine_ad.xcframework.zip",
            checksum: "8b1dfcd7bcdb2f533c637aa987c4dbc4d3d520b1ec875792a3e960a69ea06fde"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.5/Libmpv.xcframework.zip",
            checksum: "e943f933d8c5bcf7e4768bb712b7e283617a24445547dffb4cca751866e65b3a"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
