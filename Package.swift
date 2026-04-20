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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libmpv-GPL.xcframework.zip",
            checksum: "8d8a304a2f26d617539217c4edf31ef7ccc143137fe937615f6c143a10fde76a"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavcodec-GPL.xcframework.zip",
            checksum: "1586a6a543c003961fdaa55f6ad1064bbe105dfd09f8c9719a291905c8475fba"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavdevice-GPL.xcframework.zip",
            checksum: "ebc0551154863f4539120bf1116c8af99e95641235d01c6c7edbcc5a3d1ff902"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavformat-GPL.xcframework.zip",
            checksum: "83b5b127ba1e4c5c9f505871ecff27d58965b6f58a41ef1eef2412c035c71510"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavfilter-GPL.xcframework.zip",
            checksum: "668e8d0759458d8a53d9e7ade6a453dc77cead3f8835ea372586800a91cca08a"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavutil-GPL.xcframework.zip",
            checksum: "9012ddf7ace5fcfe40fc8bad982048226a3f335ab28a50f48469008b40c73b97"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libswresample-GPL.xcframework.zip",
            checksum: "f95071c8d2ea86d8e11947eafb79c64112b02a175a5a77dc7818aaafe9a46196"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libswscale-GPL.xcframework.zip",
            checksum: "ce56135fb4af6988f446b58e1b580cae526ab271f816dd79cf49e7a47102a0ba"
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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavcodec.xcframework.zip",
            checksum: "d624c46f79008f1eec0f9e9e65433d1e3c93cc97a653658158c62384a6f7e6e3"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavdevice.xcframework.zip",
            checksum: "9494b5f7098a6fb41ac42dd6585771c35c068a805c5a331bb7bbf338c7ce982b"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavformat.xcframework.zip",
            checksum: "63d7bc5b66857bbadb3c6258f00dd9428f5f46aaf12c195f2d5bfcc8acb8f00a"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavfilter.xcframework.zip",
            checksum: "0ceb61c4ea400383fe2647ab8ddef8a682f0992cd498bfc3be380c43e723aeab"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libavutil.xcframework.zip",
            checksum: "5bfde4ed582849de0dd6fc4c48ab92b1dc705683597d10df728eca9c35d965d2"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libswresample.xcframework.zip",
            checksum: "ec9f119038fd5369e67b10e9d2993496b3b8714567a00a94baa3928e65da9a1b"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libswscale.xcframework.zip",
            checksum: "8f69f3f31bc24a852e8ea0efee7fe2f3bb61c33d0271b7612ca93f4489eab004"
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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libstarmine_ad.xcframework.zip",
            checksum: "55752651c0e5e18d5a166cddaaf527ad1d6a0888d32406271adb7c8f15fd5576"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.3/Libmpv.xcframework.zip",
            checksum: "91296ecd6788adf98832e494c6a93d9551c398b3a2608f43828d7fcf03834a92"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
