package com.amao.ad2.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdExposureExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public AdExposureExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAdIdIsNull() {
            addCriterion("ad_id is null");
            return (Criteria) this;
        }

        public Criteria andAdIdIsNotNull() {
            addCriterion("ad_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdIdEqualTo(Integer value) {
            addCriterion("ad_id =", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotEqualTo(Integer value) {
            addCriterion("ad_id <>", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdGreaterThan(Integer value) {
            addCriterion("ad_id >", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ad_id >=", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdLessThan(Integer value) {
            addCriterion("ad_id <", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdLessThanOrEqualTo(Integer value) {
            addCriterion("ad_id <=", value, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdIn(List<Integer> values) {
            addCriterion("ad_id in", values, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotIn(List<Integer> values) {
            addCriterion("ad_id not in", values, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdBetween(Integer value1, Integer value2) {
            addCriterion("ad_id between", value1, value2, "adId");
            return (Criteria) this;
        }

        public Criteria andAdIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ad_id not between", value1, value2, "adId");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteIsNull() {
            addCriterion("launch_site is null");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteIsNotNull() {
            addCriterion("launch_site is not null");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteEqualTo(String value) {
            addCriterion("launch_site =", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteNotEqualTo(String value) {
            addCriterion("launch_site <>", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteGreaterThan(String value) {
            addCriterion("launch_site >", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteGreaterThanOrEqualTo(String value) {
            addCriterion("launch_site >=", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteLessThan(String value) {
            addCriterion("launch_site <", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteLessThanOrEqualTo(String value) {
            addCriterion("launch_site <=", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteLike(String value) {
            addCriterion("launch_site like", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteNotLike(String value) {
            addCriterion("launch_site not like", value, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteIn(List<String> values) {
            addCriterion("launch_site in", values, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteNotIn(List<String> values) {
            addCriterion("launch_site not in", values, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteBetween(String value1, String value2) {
            addCriterion("launch_site between", value1, value2, "launchSite");
            return (Criteria) this;
        }

        public Criteria andLaunchSiteNotBetween(String value1, String value2) {
            addCriterion("launch_site not between", value1, value2, "launchSite");
            return (Criteria) this;
        }

        public Criteria andExposureAmountIsNull() {
            addCriterion("exposure_amount is null");
            return (Criteria) this;
        }

        public Criteria andExposureAmountIsNotNull() {
            addCriterion("exposure_amount is not null");
            return (Criteria) this;
        }

        public Criteria andExposureAmountEqualTo(Integer value) {
            addCriterion("exposure_amount =", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountNotEqualTo(Integer value) {
            addCriterion("exposure_amount <>", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountGreaterThan(Integer value) {
            addCriterion("exposure_amount >", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountGreaterThanOrEqualTo(Integer value) {
            addCriterion("exposure_amount >=", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountLessThan(Integer value) {
            addCriterion("exposure_amount <", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountLessThanOrEqualTo(Integer value) {
            addCriterion("exposure_amount <=", value, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountIn(List<Integer> values) {
            addCriterion("exposure_amount in", values, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountNotIn(List<Integer> values) {
            addCriterion("exposure_amount not in", values, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountBetween(Integer value1, Integer value2) {
            addCriterion("exposure_amount between", value1, value2, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andExposureAmountNotBetween(Integer value1, Integer value2) {
            addCriterion("exposure_amount not between", value1, value2, "exposureAmount");
            return (Criteria) this;
        }

        public Criteria andWebIconIsNull() {
            addCriterion("web_icon is null");
            return (Criteria) this;
        }

        public Criteria andWebIconIsNotNull() {
            addCriterion("web_icon is not null");
            return (Criteria) this;
        }

        public Criteria andWebIconEqualTo(String value) {
            addCriterion("web_icon =", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconNotEqualTo(String value) {
            addCriterion("web_icon <>", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconGreaterThan(String value) {
            addCriterion("web_icon >", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconGreaterThanOrEqualTo(String value) {
            addCriterion("web_icon >=", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconLessThan(String value) {
            addCriterion("web_icon <", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconLessThanOrEqualTo(String value) {
            addCriterion("web_icon <=", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconLike(String value) {
            addCriterion("web_icon like", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconNotLike(String value) {
            addCriterion("web_icon not like", value, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconIn(List<String> values) {
            addCriterion("web_icon in", values, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconNotIn(List<String> values) {
            addCriterion("web_icon not in", values, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconBetween(String value1, String value2) {
            addCriterion("web_icon between", value1, value2, "webIcon");
            return (Criteria) this;
        }

        public Criteria andWebIconNotBetween(String value1, String value2) {
            addCriterion("web_icon not between", value1, value2, "webIcon");
            return (Criteria) this;
        }

        public Criteria andOrderIndexIsNull() {
            addCriterion("order_index is null");
            return (Criteria) this;
        }

        public Criteria andOrderIndexIsNotNull() {
            addCriterion("order_index is not null");
            return (Criteria) this;
        }

        public Criteria andOrderIndexEqualTo(Integer value) {
            addCriterion("order_index =", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexNotEqualTo(Integer value) {
            addCriterion("order_index <>", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexGreaterThan(Integer value) {
            addCriterion("order_index >", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexGreaterThanOrEqualTo(Integer value) {
            addCriterion("order_index >=", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexLessThan(Integer value) {
            addCriterion("order_index <", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexLessThanOrEqualTo(Integer value) {
            addCriterion("order_index <=", value, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexIn(List<Integer> values) {
            addCriterion("order_index in", values, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexNotIn(List<Integer> values) {
            addCriterion("order_index not in", values, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexBetween(Integer value1, Integer value2) {
            addCriterion("order_index between", value1, value2, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andOrderIndexNotBetween(Integer value1, Integer value2) {
            addCriterion("order_index not between", value1, value2, "orderIndex");
            return (Criteria) this;
        }

        public Criteria andExposureDaysIsNull() {
            addCriterion("exposure_days is null");
            return (Criteria) this;
        }

        public Criteria andExposureDaysIsNotNull() {
            addCriterion("exposure_days is not null");
            return (Criteria) this;
        }

        public Criteria andExposureDaysEqualTo(Integer value) {
            addCriterion("exposure_days =", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysNotEqualTo(Integer value) {
            addCriterion("exposure_days <>", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysGreaterThan(Integer value) {
            addCriterion("exposure_days >", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysGreaterThanOrEqualTo(Integer value) {
            addCriterion("exposure_days >=", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysLessThan(Integer value) {
            addCriterion("exposure_days <", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysLessThanOrEqualTo(Integer value) {
            addCriterion("exposure_days <=", value, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysIn(List<Integer> values) {
            addCriterion("exposure_days in", values, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysNotIn(List<Integer> values) {
            addCriterion("exposure_days not in", values, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysBetween(Integer value1, Integer value2) {
            addCriterion("exposure_days between", value1, value2, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andExposureDaysNotBetween(Integer value1, Integer value2) {
            addCriterion("exposure_days not between", value1, value2, "exposureDays");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andIsValidityIsNull() {
            addCriterion("is_validity is null");
            return (Criteria) this;
        }

        public Criteria andIsValidityIsNotNull() {
            addCriterion("is_validity is not null");
            return (Criteria) this;
        }

        public Criteria andIsValidityEqualTo(String value) {
            addCriterion("is_validity =", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityNotEqualTo(String value) {
            addCriterion("is_validity <>", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityGreaterThan(String value) {
            addCriterion("is_validity >", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityGreaterThanOrEqualTo(String value) {
            addCriterion("is_validity >=", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityLessThan(String value) {
            addCriterion("is_validity <", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityLessThanOrEqualTo(String value) {
            addCriterion("is_validity <=", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityLike(String value) {
            addCriterion("is_validity like", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityNotLike(String value) {
            addCriterion("is_validity not like", value, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityIn(List<String> values) {
            addCriterion("is_validity in", values, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityNotIn(List<String> values) {
            addCriterion("is_validity not in", values, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityBetween(String value1, String value2) {
            addCriterion("is_validity between", value1, value2, "isValidity");
            return (Criteria) this;
        }

        public Criteria andIsValidityNotBetween(String value1, String value2) {
            addCriterion("is_validity not between", value1, value2, "isValidity");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(Integer value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(Integer value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(Integer value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(Integer value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(Integer value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(Integer value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<Integer> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<Integer> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(Integer value1, Integer value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(Integer value1, Integer value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_ad_exposure
     *
     * @mbggenerated do_not_delete_during_merge Wed May 25 01:14:10 CST 2016
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_ad_exposure
     *
     * @mbggenerated Wed May 25 01:14:10 CST 2016
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value) {
            super();
            this.condition = condition;
            this.value = value;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.betweenValue = true;
        }
    }
}