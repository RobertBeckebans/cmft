/*
 * Copyright 2014-2015 Dario Manesku. All rights reserved.
 * License: http://www.opensource.org/licenses/BSD-2-Clause
 */

#ifndef CMFT_TESTS_H_HEADER_GUARD
#define CMFT_TESTS_H_HEADER_GUARD

#include "../cmft_cli/cmft_cli.h"
#include "tokenize.h"

static const char s_radianceTest[] =
{
    "--input \"okretnica.tga\"           "
    "--filter radiance                   "
    "--srcFaceSize 256                   "
    "--excludeBase false                 "
    "--mipCount 10                       "
    "--glossScale 10                     "
    "--glossBias 1                       "
    "--lightingModel phongbrdf           "
    "--dstFaceSize 256                   "
    "--numCpuProcessingThreads 4         "
    "--useOpenCL true                    "
    "--clVendor anyGpuVendor             "
    "--deviceType gpu                    "
    "--deviceIndex 0                     "
    "--inputGammaNumerator 2.2           "
    "--inputGammaDenominator 1.0         "
    "--outputGammaNumerator 1.0          "
    "--outputGammaDenominator 2.2        "
    "--generateMipChain false            "
    "--outputNum 1                       "
    "--output0 \"okretnica_pmrem\"       "
    "--output0params dds,bgra8,cubemap   "
};

static const char s_outputTest[] =
{
    "--input \"okretnica.tga\"          "
    "--filter none                      "
    "--outputNum 7                      "
    "--output0 \"okretnica_cubemap\"    "
    "--output0params dds,bgra8,cubemap  "
    "--output1 \"okretnica_latlong\"    "
    "--output1params dds,bgra8,latlong  "
    "--output2 \"okretnica_hcross\"     "
    "--output2params dds,bgra8,hcross   "
    "--output3 \"okretnica_vcross\"     "
    "--output3params dds,bgra8,vcross   "
    "--output4 \"okretnica_hstrip\"     "
    "--output4params dds,bgra8,hstrip   "
    "--output5 \"okretnica_vstrip\"     "
    "--output5params dds,bgra8,vstrip   "
    "--output6 \"okretnica_facelist\"   "
    "--output6params dds,bgra8,facelist "
};

int test(const char* _cmd)
{
    char data[2048];
    uint32_t dataSize;
    int argc;
    char* argv[128];
    tokenizeCommandLine(_cmd, data, dataSize, argc, argv, BX_COUNTOF(argv), '\0');
    return cmftMain(argc, argv);
}

int testsMain(int _argc, char const* const* _argv)
{
    BX_UNUSED(_argc);
    BX_UNUSED(_argv);

    test(s_radianceTest);
    test(s_outputTest);

    return 0;
}

#endif //CMFT_TESTS_H_HEADER_GUARD

/* vim: set sw=4 ts=4 expandtab: */
