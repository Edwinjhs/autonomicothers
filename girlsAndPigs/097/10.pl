use strict;
use warnings;

sub num_solutions {
    my ($legs, $breasts) = @_;
    my $solutions;

    my $max_pigs = int($legs / 4);
    $max_pigs-- if $legs % 4 == 0;

    for my $pigs (1..$max_pigs) {
        my $girls = ($legs - 4 * $pigs) / 2;
        my $pig_breasts = $breasts - $girls * 2;

        $solutions++ if $pig_breasts % (2 * $pigs) == 0;
    }
    return $solutions;
}

my @answers;

chomp(my $n = <>);
for (1..$n) {
    chomp(my $legs_breasts = <>);
    my ($legs, $breasts) = split ' ', $legs_breasts;

    push @answers, num_solutions($legs, $breasts);
}

print join ' ', @answers;
