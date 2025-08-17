module MyModule::CivicEngagementCredits {

    use aptos_framework::signer;

    /// Struct to store the number of civic credits earned by a student
    struct CivicRecord has key {
        credits: u64,
    }

    /// Function to initialize a record for a student with 0 credits
    public fun init_record(student: &signer) {
        move_to(student, CivicRecord { credits: 0 });
    }

    /// Function to verify a civic activity and award credits
    public fun award_credit(authority: &signer, student: address, credit_amount: u64) acquires CivicRecord {
        let record = borrow_global_mut<CivicRecord>(student);
        record.credits = record.credits + credit_amount;
    }
}
