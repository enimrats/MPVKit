// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14), .visionOS(.v1)],
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
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libmpv-GPL.xcframework.zip",
            checksum: "dc4b76566095013ec10df4c6a6e1ba3a7347d19d642fcfb5eaca859cf38e1ea4"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavcodec-GPL.xcframework.zip",
            checksum: "5548941ec040ef8da4a5070905f10f73b93cfabc9f6b1d62cb804e35d2876913"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavdevice-GPL.xcframework.zip",
            checksum: "bdc14efd044bfc3026bc9b3db6ecca85891cb66e2f65edf8f587a783e4ba992c"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavformat-GPL.xcframework.zip",
            checksum: "17f61ccb105de2f065d57ae7afef65ae25bca19e95da965ac7605a1bf74f362b"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavfilter-GPL.xcframework.zip",
            checksum: "8b738638c0db7c16cbf81bc55906def25fe853dee65de1f8b3178966d31d87c2"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavutil-GPL.xcframework.zip",
            checksum: "1f244b7225142e82b1fc6797960c7dbf2def5b32bb70d949590cdc476caafb44"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libswresample-GPL.xcframework.zip",
            checksum: "046225853ef195e6bf804e479640b766edccc58e140277f63863c818dfba2340"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libswscale-GPL.xcframework.zip",
            checksum: "6f21cfddb4da6e0ed94accb82f1a8d6a86778c108025554c6960bedfd6e65b87"
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
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.360.1/Libplacebo.xcframework.zip",
            checksum: "2fa3d54cb81f302d6f11c7b2f509af30944381c3b11ee9d35096eb4637a6e2dd"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.2-xcode/Libdav1d.xcframework.zip",
            checksum: "8a8b78e23e28ecc213232805f3c1936141fc9befe113e87234f4f897f430a532"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavcodec.xcframework.zip",
            checksum: "4fb2b895fd0e112fd62d734110d55a694fad5fde0145aa6f0ea939fb31c95e58"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavdevice.xcframework.zip",
            checksum: "3980043361df6638d60df3fa9e3fc3e4a1f27487b2f047fc63024462ce329a1c"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavformat.xcframework.zip",
            checksum: "98f1db6a4db15f2965bb45640868f18e1d8d3f3d2ca7e1ee1c5e82a348fe636c"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavfilter.xcframework.zip",
            checksum: "199ff341c176ff20e70defe49beeea9b228f21a6372fa0064784788d602ace58"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libavutil.xcframework.zip",
            checksum: "4fd6b4eaa9637ad2373a4a45265318b8c753dceb67dd0dabf7f7cfc255c17b49"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libswresample.xcframework.zip",
            checksum: "4e726a31c2d1df378615f92c09714bf91afffd37e728b893d88ea36ed52fae82"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libswscale.xcframework.zip",
            checksum: "41a3195e6f893308ec2147ffe377fa17ffeb00f484a81035033814625246a2ae"
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
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libstarmine_ad.xcframework.zip",
            checksum: "cf2020eaef671ec56b9156ad2d3b4ed53173779d42b7c8759fcde1e5e03f338e"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/enimrats/MPVKit/releases/download/0.41.0-starmine.6/Libmpv.xcframework.zip",
            checksum: "02f07e4691c65e168e63f0c0d6f37ddfa9de57815b0830a8ed21638ea9244d2a"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
