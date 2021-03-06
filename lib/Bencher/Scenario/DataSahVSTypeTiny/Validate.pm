package Bencher::Scenario::DataSahVSTypeTiny::Validate;

use 5.010001;

# AUTHORITY
# DATE
# DIST
# VERSION

eval "package main; use Types::Standard qw(ArrayRef Int)";

our $scenario = {
    summary => 'Benchmark validation',
    modules => {
        'Data::Sah' => {version=>'0.907'},
    },
    participants => [
        {
            name => 'dsah',
            module => 'Data::Sah',
            code_template => 'state $v = Data::Sah::gen_validator(<schema>); $v->(<data>)',
            tags => ['dsah'],
        },
        {
            name => 'tt',
            #module => 'Types::Standard',
            code_template => 'state $v = (<type:raw>)->compiled_check; $v->(<data>)',
            tags => ['tt'],
        },
    ],
    datasets => [
        {
            name => 'int(dsah)',
            include_participant_tags => ['dsah'],
            args => {
                schema => 'int*',
                'data@' => [undef, 1, "a"],
            },
        },
        {
            name => 'int(tt)',
            include_participant_tags => ['tt'],
            args => {
                type => 'Int',
                'data@' => [undef, 1, "a"],
            },
        },

        {
            name => 'array10(dsah)',
            include_participant_tags => ['dsah'],
            args => {
                schema => ['array', of=>'int*'],
                'data' => [1..10],
            },
        },
        {
            name => 'array10(tt)',
            include_participant_tags => ['tt'],
            args => {
                type => 'ArrayRef[Int]',
                'data' => [1..10],
            },
        },
    ],
};

1;
# ABSTRACT:
