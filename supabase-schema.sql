-- ============================================
-- SUPABASE DATABASE SCHEMA DOCUMENTATION
-- ============================================
-- Project: ylsapyykgumlaiomrplm
-- Generated: 2026-02-04T19:35:33.965Z
-- 
-- ⚠️  IMPORTANT: This is DOCUMENTATION of existing schema
-- These tables ALREADY EXIST in the database
-- Do NOT execute these CREATE statements
-- Use this as REFERENCE when writing migrations
-- ============================================

-- ============================================
-- Table: app_environment_keys
-- ============================================
CREATE TABLE public.app_environment_keys (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id text NOT NULL,
    user_id text NOT NULL,
    key_name text NOT NULL,
    key_value text NOT NULL,
    service_name text,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: app_key_access_logs
-- ============================================
CREATE TABLE public.app_key_access_logs (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id text NOT NULL,
    user_id text NOT NULL,
    accessed_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: credit_topups
-- ============================================
CREATE TABLE public.credit_topups (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id text NOT NULL,
    amount numeric NOT NULL,
    payment_method text NOT NULL,
    payment_id text,
    description text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: credit_transactions
-- ============================================
CREATE TABLE public.credit_transactions (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id character varying NOT NULL,
    transaction_type text NOT NULL,
    amount numeric NOT NULL,
    balance_before numeric NOT NULL,
    balance_after numeric NOT NULL,
    reference_type text,
    reference_id text,
    description text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: debug_logs
-- ============================================
CREATE TABLE public.debug_logs (
    id integer NOT NULL DEFAULT nextval('debug_logs_id_seq'::regclass),
    user_id text,
    log_type text,
    message text,
    data jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: error_logs
-- ============================================
CREATE TABLE public.error_logs (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    project_id text NOT NULL,
    error_type text NOT NULL,
    error_message text NOT NULL,
    error_stack text,
    component_stack text,
    missing_component text,
    timestamp timestamp with time zone NOT NULL DEFAULT now(),
    created_at timestamp with time zone DEFAULT now(),
    occurrence_count integer DEFAULT 1,
    last_occurrence timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: generated_pages
-- ============================================
CREATE TABLE public.generated_pages (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL,
    page_name character varying NOT NULL,
    page_info jsonb NOT NULL,
    component_code text,
    styles_code text,
    state_requirements jsonb DEFAULT '[]'::jsonb,
    navigation_params jsonb DEFAULT '[]'::jsonb,
    exports jsonb DEFAULT '[]'::jsonb,
    dependencies jsonb DEFAULT '[]'::jsonb,
    generation_order integer NOT NULL,
    status character varying DEFAULT 'pending'::character varying,
    error_message text,
    generated_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: generation_progress
-- ============================================
CREATE TABLE public.generation_progress (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL,
    prompt text NOT NULL,
    user_id text,
    complexity_preference character varying DEFAULT 'moderate'::character varying,
    tier character varying DEFAULT 'standard'::character varying,
    current_step character varying DEFAULT 'schema_analysis'::character varying,
    step_index integer DEFAULT 0,
    total_steps integer DEFAULT 5,
    overall_progress integer DEFAULT 0,
    estimated_time_remaining integer DEFAULT 65,
    steps_status jsonb DEFAULT '[]'::jsonb,
    status character varying DEFAULT 'running'::character varying,
    error_message text,
    generated_schema jsonb,
    generated_pages jsonb,
    generated_contexts jsonb,
    final_bundle_path text,
    started_at timestamp with time zone DEFAULT now(),
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: generation_sessions
-- ============================================
CREATE TABLE public.generation_sessions (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id uuid,
    prompt text NOT NULL,
    analysis jsonb,
    status character varying DEFAULT 'analyzing'::character varying,
    current_phase integer DEFAULT 1,
    total_pages integer DEFAULT 0,
    completed_pages integer DEFAULT 0,
    estimated_time integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: iap_verification_log
-- ============================================
CREATE TABLE public.iap_verification_log (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id character varying NOT NULL,
    platform text NOT NULL,
    transaction_id text NOT NULL,
    product_id text NOT NULL,
    verified boolean NOT NULL,
    verification_response jsonb,
    status text NOT NULL,
    error_message text,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: integrated_apps
-- ============================================
CREATE TABLE public.integrated_apps (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL,
    main_component_code text NOT NULL,
    navigation_config text,
    state_management_code text,
    types_definitions text,
    package_dependencies jsonb DEFAULT '[]'::jsonb,
    bundle_path character varying,
    bundle_size integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: missing_components_summary
-- ============================================
CREATE TABLE public.missing_components_summary (
    missing_component text,
    unique_error_count bigint,
    total_occurrences bigint,
    affected_projects bigint,
    last_occurrence timestamp with time zone,
    first_occurrence timestamp with time zone
);

-- ============================================
-- Table: pozisyonlar
-- ============================================
CREATE TABLE public.pozisyonlar (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    isim text NOT NULL,
    aciklama text,
    kategori text,
    zorluk_seviyesi text,
    created_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: projects
-- ============================================
CREATE TABLE public.projects (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    prompt text NOT NULL,
    code text NOT NULL,
    bundle_path text NOT NULL,
    user_id uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: promo_code_usage
-- ============================================
CREATE TABLE public.promo_code_usage (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    promo_code_id uuid NOT NULL,
    user_id text NOT NULL,
    code_used text NOT NULL,
    credit_amount numeric NOT NULL,
    ip_address text,
    user_agent text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: promo_codes
-- ============================================
CREATE TABLE public.promo_codes (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    code text NOT NULL,
    description text,
    credit_amount numeric NOT NULL,
    max_uses integer DEFAULT 1,
    uses_count integer DEFAULT 0,
    max_uses_per_user integer DEFAULT 1,
    valid_from timestamp without time zone DEFAULT now(),
    valid_until timestamp without time zone,
    is_active boolean DEFAULT true,
    campaign_name text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: public_waitlist_stats
-- ============================================
CREATE TABLE public.public_waitlist_stats (
    total_signups bigint,
    referral_signups bigint,
    referral_percentage numeric,
    early_access_users bigint,
    pro_tier_users bigint,
    top_referrer_count integer
);

-- ============================================
-- Table: subscription_plans
-- ============================================
CREATE TABLE public.subscription_plans (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    product_id_ios text NOT NULL,
    product_id_android text NOT NULL,
    plan_name text NOT NULL,
    plan_code text NOT NULL,
    price_usd numeric NOT NULL,
    monthly_credits numeric NOT NULL,
    features jsonb DEFAULT '{}'::jsonb,
    is_popular boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: subscription_renewals
-- ============================================
CREATE TABLE public.subscription_renewals (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_subscription_id uuid NOT NULL,
    user_id character varying NOT NULL,
    subscription_id text NOT NULL,
    transaction_id text NOT NULL,
    renewal_date timestamp without time zone NOT NULL,
    credits_granted integer NOT NULL,
    amount_paid numeric,
    currency text DEFAULT 'USD'::text,
    receipt_data text,
    verified boolean DEFAULT true,
    verified_at timestamp without time zone DEFAULT now(),
    created_at timestamp without time zone DEFAULT now(),
    original_transaction_id character varying,
    plan_id uuid
);

-- ============================================
-- Table: usage_logs
-- ============================================
CREATE TABLE public.usage_logs (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id text NOT NULL,
    app_id text,
    operation_type text NOT NULL,
    cost_usd numeric NOT NULL,
    tokens_input integer,
    tokens_output integer,
    tokens_cache_creation integer,
    tokens_cache_read integer,
    duration_ms integer,
    session_id text,
    connection_id text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: user_github_connections
-- ============================================
CREATE TABLE public.user_github_connections (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id character varying NOT NULL,
    github_user_id bigint NOT NULL,
    github_username character varying NOT NULL,
    github_email character varying,
    access_token text NOT NULL,
    token_type character varying DEFAULT 'bearer'::character varying,
    scope text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    last_used_at timestamp without time zone
);

-- ============================================
-- Table: user_subscriptions
-- ============================================
CREATE TABLE public.user_subscriptions (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    user_id character varying NOT NULL,
    plan_id uuid NOT NULL,
    plan_code text NOT NULL,
    plan_name text,
    platform text NOT NULL,
    subscription_id text NOT NULL,
    original_transaction_id text,
    current_period_start timestamp without time zone NOT NULL,
    current_period_end timestamp without time zone NOT NULL,
    next_billing_date timestamp without time zone,
    total_credits numeric DEFAULT 0,
    used_credits numeric DEFAULT 0,
    available_credits numeric DEFAULT 0,
    status text DEFAULT 'active'::text,
    cancel_at_period_end boolean DEFAULT false,
    cancelled_at timestamp without time zone,
    last_renewal_at timestamp without time zone,
    renewal_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    account_deactivated_at timestamp with time zone
);

-- ============================================
-- Table: v3_app_modifications
-- ============================================
CREATE TABLE public.v3_app_modifications (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id character varying NOT NULL,
    user_id uuid,
    modification_request text NOT NULL,
    chat_context jsonb DEFAULT '[]'::jsonb,
    change_type character varying NOT NULL,
    target_components ARRAY DEFAULT '{}'::text[],
    impact_scope character varying DEFAULT 'isolated'::character varying,
    original_schema jsonb,
    modified_schema jsonb,
    changed_files jsonb DEFAULT '{}'::jsonb,
    delta_bundle_path character varying,
    delta_size integer DEFAULT 0,
    version_number character varying NOT NULL,
    parent_version character varying,
    status character varying DEFAULT 'analyzing'::character varying,
    progress_data jsonb DEFAULT '{}'::jsonb,
    token_usage integer DEFAULT 0,
    generation_time_ms integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: v3_app_schemas
-- ============================================
CREATE TABLE public.v3_app_schemas (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id character varying NOT NULL,
    user_id character varying NOT NULL,
    prompt text NOT NULL,
    schema_data jsonb NOT NULL,
    status character varying DEFAULT 'schema_created'::character varying,
    total_pages integer DEFAULT 0,
    total_components integer DEFAULT 0,
    total_contexts integer DEFAULT 0,
    complexity_level integer DEFAULT 1,
    bundle_size integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    progress_data jsonb DEFAULT '{"steps": [], "current_step": "analyzing", "current_phase": "Schema Analysis", "completed_steps": [], "progress_percentage": 0}'::jsonb,
    github_repo_url text,
    github_owner text,
    github_repo_name text,
    latest_commit_hash text,
    github_created_at timestamp with time zone,
    deleted_at timestamp with time zone,
    deleted_by text,
    bundle_path text,
    is_public boolean DEFAULT false,
    share_token character varying,
    share_created_at timestamp without time zone,
    share_expires_at timestamp without time zone,
    view_count integer DEFAULT 0,
    is_archived boolean DEFAULT false,
    archived_at timestamp with time zone
);

-- ============================================
-- Table: v3_chat_conversations
-- ============================================
CREATE TABLE public.v3_chat_conversations (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id character varying NOT NULL,
    user_id uuid NOT NULL,
    messages jsonb NOT NULL DEFAULT '[]'::jsonb,
    active_session boolean DEFAULT true,
    last_message_at timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    archived_at timestamp with time zone,
    is_archived boolean DEFAULT false
);

-- ============================================
-- Table: v3_chat_messages
-- ============================================
CREATE TABLE public.v3_chat_messages (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL,
    type text NOT NULL,
    content text NOT NULL,
    processing_route text,
    tokens_used integer DEFAULT 0,
    processing_time integer DEFAULT 0,
    confidence_score numeric,
    metadata jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: v3_chat_sessions
-- ============================================
CREATE TABLE public.v3_chat_sessions (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id text NOT NULL,
    user_id text,
    session_token text NOT NULL,
    websocket_session_id text,
    status text DEFAULT 'initialized'::text,
    client_info jsonb DEFAULT '{}'::jsonb,
    last_activity timestamp without time zone DEFAULT now(),
    messages_count integer DEFAULT 0,
    total_tokens_used integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    connected_at timestamp without time zone,
    disconnected_at timestamp without time zone
);

-- ============================================
-- Table: v3_component_versions
-- ============================================
CREATE TABLE public.v3_component_versions (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    app_id character varying NOT NULL,
    component_name character varying NOT NULL,
    version_number character varying NOT NULL,
    component_code text NOT NULL,
    change_summary text,
    modification_id uuid,
    created_at timestamp with time zone DEFAULT now()
);

-- ============================================
-- Table: v4_app_context
-- ============================================
CREATE TABLE public.v4_app_context (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    app_md_content text NOT NULL,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: v4_bundles
-- ============================================
CREATE TABLE public.v4_bundles (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    bundle_type text NOT NULL,
    bundle_path text NOT NULL,
    bundle_size integer NOT NULL,
    bundle_hash text,
    source_files_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    bundle_content text,
    transform_time integer DEFAULT 0,
    source_size integer DEFAULT 0
);

-- ============================================
-- Table: v4_conversation_memory
-- ============================================
CREATE TABLE public.v4_conversation_memory (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    user_id text,
    turn_number integer NOT NULL,
    user_prompt text NOT NULL,
    ai_understanding jsonb NOT NULL,
    action_taken text NOT NULL,
    changes_made ARRAY NOT NULL,
    design_preferences jsonb,
    created_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: v4_design_thinking
-- ============================================
CREATE TABLE public.v4_design_thinking (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    thinking_data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: v4_metadata
-- ============================================
CREATE TABLE public.v4_metadata (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    total_pages integer NOT NULL DEFAULT 0,
    total_contexts integer NOT NULL DEFAULT 0,
    total_components integer NOT NULL DEFAULT 0,
    page_names ARRAY NOT NULL DEFAULT '{}'::text[],
    context_names ARRAY NOT NULL DEFAULT '{}'::text[],
    component_names ARRAY NOT NULL DEFAULT '{}'::text[],
    segment_ids ARRAY NOT NULL DEFAULT '{}'::text[],
    has_theme boolean DEFAULT true,
    navigation_type text,
    required_packages ARRAY NOT NULL DEFAULT '{}'::text[],
    complexity_level integer DEFAULT 1,
    app_category text,
    app_language text DEFAULT 'English'::text,
    recent_modifications jsonb,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: v4_project_files
-- ============================================
CREATE TABLE public.v4_project_files (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    app_id text NOT NULL,
    file_path text NOT NULL,
    file_content text NOT NULL,
    file_type text NOT NULL,
    file_size integer DEFAULT 0,
    last_modified timestamp without time zone DEFAULT now()
);

-- ============================================
-- Table: waitlist
-- ============================================
CREATE TABLE public.waitlist (
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    email text NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    status text DEFAULT 'pending'::text,
    source text DEFAULT 'landing_page'::text,
    metadata jsonb DEFAULT '{}'::jsonb,
    name text,
    referral_code text,
    referred_by_code text,
    referral_count integer DEFAULT 1,
    position integer,
    platform text,
    category text,
    language character varying DEFAULT 'en'::character varying,
    utm_source text
);

-- ============================================
-- Table: waitlist_leaderboard
-- ============================================
CREATE TABLE public.waitlist_leaderboard (
    display_name text,
    masked_email text,
    referral_count integer,
    status_tier text,
    joined_date date
);

-- ============================================
-- Table: waitlist_referral_check
-- ============================================
CREATE TABLE public.waitlist_referral_check (
    referral_code text,
    valid boolean
);

-- ============================================
-- Table: webhook_logs
-- ============================================
CREATE TABLE public.webhook_logs (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    webhook_type text NOT NULL,
    notification_type text,
    subtype text,
    transaction_id text,
    original_transaction_id text,
    product_id text,
    user_id text,
    status text NOT NULL,
    error_message text,
    raw_payload jsonb,
    created_at timestamp without time zone DEFAULT now(),
    processed_at timestamp without time zone,
    processing_duration_ms integer
);

