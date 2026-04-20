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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libmpv-GPL.xcframework.zip",
            checksum: "ca93087d277c833ab6d3d618d3cca8bf2f5d8975c7bf7c3fdb72903c3c58590b"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavcodec-GPL.xcframework.zip",
            checksum: "8ff2321098a5e492b233e8354a314ad7fbec51d81a31ff0d089ce7d8d2c2daeb"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavdevice-GPL.xcframework.zip",
            checksum: "71cf798de0155a0f8ed2e2385dea6b1e2e9a5d25882b93f38dab148994cd0bd7"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavformat-GPL.xcframework.zip",
            checksum: "5b74bc1c0ffc6ed9b124ae34ee1a210dd396c117ca5a80b4a50dab488a690f69"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavfilter-GPL.xcframework.zip",
            checksum: "55e672f0eaa81ca81ae66a980d82fc945091f46251be7a54c766d5a42ff1c3f1"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavutil-GPL.xcframework.zip",
            checksum: "32754d91d845489d0bc4280cd6a043076ba143e56f0d707d6d105aa44c548d94"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libswresample-GPL.xcframework.zip",
            checksum: "efb04d9c2d5bd7908897110e2959308d7406756f051926f58c91c119ea486241"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libswscale-GPL.xcframework.zip",
            checksum: "781be85e9cc88c912b67e1db558873c0b635cc93e748753fe9807af2d17c29a5"
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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavcodec.xcframework.zip",
            checksum: "25a39e7cf9e2a257b41c1886bd8b0550dc4b94034b780cf2d2158a807af1d78f"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavdevice.xcframework.zip",
            checksum: "aa4e635afeedd792de5ada1302a409897ac9c6121a430656a30e45c5999b3609"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavformat.xcframework.zip",
            checksum: "26b5df92bc1865bf22c305384f18fa360b39c3e55143bf1148cbb8b3a672961d"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavfilter.xcframework.zip",
            checksum: "1b1c4468f26dc424e842326603bf00cf14e0c4c1e0466b2851a01b9c8a963feb"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libavutil.xcframework.zip",
            checksum: "c9d6af06d3810a3530f26587384de62137ad17fe31d2c723d1f357aec2d5a71b"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libswresample.xcframework.zip",
            checksum: "beefd946fe84d59cbbe749a29c330f500200c1ac9c1736fb89b85070f61f1216"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libswscale.xcframework.zip",
            checksum: "707b26e580cd49edb9ee3282d44ef5df8d1637b65013642b11e703586df0ef5c"
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
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libstarmine_ad.xcframework.zip",
            checksum: "57b38db122389fbdef2211cca2c80e96803e445e5c47c8d7a63dc54f505d5257"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/yuygfgg/MPVKit/releases/download/0.41.0-starmine.4/Libmpv.xcframework.zip",
            checksum: "36554242ef13c2efef8d1a04795d05aec49530d800dae43719e61424848e5dba"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
