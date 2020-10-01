package Bencher::Scenario::DataSahVSTypeTiny::Startup;

# AUTHORITY
# DATE
# DIST
# VERSION

our $scenario = {
    summary => 'Benchmark startup',
    participants => [
        {
            name => 'perl',
            perl_cmdline => ["-e1"],
        },
        {
            name => 'load_dsah',
            summary => 'Load Data::Sah',
            perl_cmdline => ["-MData::Sah", "-e1"],
        },
        {
            name => 'load_tt',
            summary => 'Load Type::Tiny',
            perl_cmdline => ["-MType::Tiny", "-e1"],
        },
        {
            name => 'genv_dsah',
            summary => 'Generate validator (int*) with Data::Sah',
            perl_cmdline => ["-MData::Sah=gen_validator", "-e", 'gen_validator("int*")'],
        },
        {
            name => 'genv_tt',
            summary => 'Generate validator (Int) with Type::Tiny',
            perl_cmdline => ["-MTypes::Standard=Int", "-e1"],
        },
    ],
};

1;
# ABSTRACT:
